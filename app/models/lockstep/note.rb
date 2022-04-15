class Lockstep::Note < Lockstep::ApiRecord
  self.model_name_uri = "v1/Notes"
  self.id_ref = "note_id"
  load_schema(Schema::Note)

  belongs_to :created_user, class_name: "Lockstep::User", foreign_key: :created_user_id, primary_key: :user_id
end
