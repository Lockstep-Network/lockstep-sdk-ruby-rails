module Lockstep::ActiveRecords::Association
  extend ActiveSupport::Concern

  included do

  end

  class_methods do
    def lockstep_has_many_relations
      @lockstep_has_many_relations ||= {}
    end

    def lockstep_belongs_to_relations
      @lockstep_belongs_to_relations ||= {}
    end

    def lockstep_has_many(attribute, class_name:, primary_key: 'lockstep_id', foreign_key: nil, polymorphic: nil, loader: nil)
      lockstep_has_many_relations[attribute] = {
        name: attribute, class_name: class_name, primary_key: primary_key,
        foreign_key: foreign_key, polymorphic: polymorphic, loader: loader
      }

      define_method(attribute) do
        return lockstep_attributes[attribute] unless lockstep_attributes[attribute].nil?
        return nil if lockstep_loaded_associations.include?(attribute)

        lockstep_loaded_associations << attribute

        relation_config = self.class.lockstep_has_many_relations[attribute]
        if relation_config[:loader].present?
          lockstep_attributes[attribute] = relation_config[:loader].call(self)
        else
          query = { relation_config[:foreign_key] => self.send(relation_config[:primary_key]) }
          if relation_config[:polymorphic]
            polymorphic_config = Lockstep::RelationArray.has_many_polymorphic_attributes(self, relation_config[:polymorphic])
            query.merge!(polymorphic_config)
          end
          related_objects = relation_config[:class_name].constantize.send(:where, query).execute
          lockstep_attributes[attribute] = Lockstep::RelationArray.new self, related_objects, attribute, relation_config[:class_name]
        end

        lockstep_attributes[attribute]
      end
    end

    def lockstep_belongs_to(attribute, class_name:, primary_key: nil, foreign_key: 'lockstep_id', polymorphic: nil, loader: nil)
      lockstep_belongs_to_relations[attribute] = {
        name: attribute, class_name: class_name, primary_key: primary_key,
        foreign_key: foreign_key, polymorphic: polymorphic, loader: loader
      }

      define_method(attribute) do
        return lockstep_attributes[attribute] unless lockstep_attributes[attribute].nil?
        return nil if lockstep_loaded_associations.include?(attribute)

        lockstep_loaded_associations << attribute

        relation_config = self.class.lockstep_belongs_to_relations[attribute]
        if relation_config[:loader].present?
          lockstep_attributes[attribute] = relation_config[:loader].call(self)
        else
          lockstep_attributes[attribute] = relation_config[:class_name].constantize.send(:find_by, relation_config[:primary_key] => self.send(relation_config[:foreign_key]))
        end

        lockstep_attributes[attribute]
      end
    end
  end

  def lockstep_loaded_associations
    @loaded_associations ||= []
  end

  def lockstep_attributes
    @lockstep_attributes ||= {}
  end

end
