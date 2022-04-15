require "open-uri"
require "json"
require "pry"
require "erb"

task :update_api_schema do
  # download_schema!
  create_models
end

class SchemaBinding
  attr_accessor :model_name, :fields, :belongs_to_relations, :has_many_relations

  def initialize(model_name, fields, belongs_to_relations, has_many_relations)
    self.model_name = model_name
    self.fields = fields
    self.belongs_to_relations = belongs_to_relations
    self.has_many_relations = has_many_relations
  end

  def class_name
    len = model_name.length
    "#{model_name[0].upcase}#{model_name[1..len - 1]}".gsub("Model", "")
  end

  # Expose private binding() method.
  def get_binding
    binding()
  end
end

SCHEMA_SWAGGER_URL = "https://api.lockstep.io/swagger/v1/swagger.json"
SCHEMA_FILE_PATH = "app/platform_api/swagger.json"
TEMPLATE = "app/platform_api/model_template.rb.erb"
SCHEMA_PATH = "app/platform_api/schema"

def download_schema!
  open(SCHEMA_FILE_PATH, "wb") do |file|
    file.truncate(0)
    file << open(SCHEMA_SWAGGER_URL).read
  end
end

def create_models
  schema = JSON.parse(File.read(SCHEMA_FILE_PATH))
  # models = schema["components"]["schemas"].keys
  schema["components"]["schemas"].each do |schema_name, schema|
    next unless schema["type"] == "object"
    next unless schema["properties"].class.name == "Hash"

    model_name = underscore(schema_name)

    # models[model_name] = {
    #   fields: {},
    #   belongs_to_relations: {},
    #   has_many_relations: {},
    # }

    fields = build_fields(schema_name, schema["properties"])
    belongs_to_relations = build_belongs_to_relations(schema_name, schema["properties"])
    has_many_relations = build_has_many_relations(schema_name, schema["properties"])

    schema_binding = SchemaBinding.new(schema_name, fields, belongs_to_relations, has_many_relations)
    renderer = ERB.new(File.read(TEMPLATE), nil, "-")
    file_contents = renderer.result(schema_binding.get_binding)

    open("#{SCHEMA_PATH}/#{model_name.gsub("_model", "")}.rb", "wb") do |f|
      f.truncate(0)
      f << file_contents
    end
  end
end

# types => ["array", "string", "boolean", "number", nil, "integer", "object"]
# formats => [nil, "uuid", "date-time", "double", "int32", "uri", "date", "int64", "email", "float"]
def schema_property_type(property)
  return "Types::Params::DateTime" if property["type"] == "string" && property["format"] == "date-time"

  nil
end

def underscore(camel_cased_word)
  camel_cased_word.to_s.gsub(/::/, "/").
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
    gsub(/([a-z\d])([A-Z])/, '\1_\2').
    tr("-", "_").
    downcase
end

def class_name(name)
  len = name.length
  "Lockstep::#{name[0].upcase}#{name[1..len - 1]}".gsub("Model", "")
end

def build_fields(schema_name, properties)
  fields = {}
  properties.each do |property_name, property|
    next if !property["items"].nil? and !property["items"]["$ref"].nil?

    property["value_type"] = schema_property_type(property)
    fields[underscore(property_name)] = property
  end
  fields
end

BELONGS_TO_RELATIONS = {
  connection: {
    keys: %w[customerId],
    class_name: "Lockstep::Connection",
    primary_key: :company_id,
  },
  account: {
    keys: %w[companyId],
    class_name: "Lockstep::Account",
    primary_key: :company_id,
  },
  created_user: {
    keys: %w[createdUserId],
    class_name: "Lockstep::User",
    primary_key: :user_id,
  },
  modified_user: {
    keys: %w[modifiedUserId],
    class_name: "Lockstep::User",
    primary_key: :user_id,
  },
}

def build_belongs_to_relations(schema_name, properties)
  belongs_to_relations = {}
  properties.each do |property_name, property|
    BELONGS_TO_RELATIONS.each do |relation_name, config|
      next unless config[:keys].include?(property_name)

      belongs_to_relations[underscore(property_name).to_s.gsub("_id", "")] = { class_name: config[:class_name], primary_key: config[:primary_key], foreign_key: underscore(property_name) }
      belongs_to_relations[underscore(relation_name)] = { class_name: config[:class_name], primary_key: config[:primary_key], foreign_key: underscore(property_name) }
    end
  end
  belongs_to_relations
end

def build_has_many_relations(schema_name, properties)
  has_many_relations = {}
  properties.each do |property_name, property|
    next unless property["type"] == "array"
    next if property["items"].nil?
    next if property["items"]["$ref"].nil?

    ref = property["items"]["$ref"].split("/").last.gsub("Model", "")

    case property_name
    when "notes"
      has_many_relations[underscore(property_name)] = { class_name: "Lockstep::Note", included: true, foreign_key: :object_key, polymorphic: { table_key: schema_name.gsub("Model", "") } }
    else
      has_many_relations[underscore(property_name)] = { class_name: "Schema::#{ref}", included: true }
    end
  end
  has_many_relations
end
