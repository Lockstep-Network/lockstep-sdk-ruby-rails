#require 'parse_resource'
# require "lockstep/query"

module SageNetwork
  module QueryMethods
    module ClassMethods
      def query_builder
        @query_builder = Query.new(self)
        unless scopes[:default_scope].nil?
          @query_builder.criteria.deep_merge!(SageNetwork::ApiRecord.instance_exec(&scopes[:default_scope]).criteria)
        end

        @query_builder
      end

      def unscoped
        Query.new(self)
      end

      def none
        query_builder.none
      end

      # Include the attributes of a parent ojbect in the results
      # Similar to ActiveRecord eager loading
      #
      def include_object(*associations)
        query_builder.include_object(*associations)
      end

      # Add this at the end of a method chain to get the count of objects, instead of an Array of objects
      def count
        #https://www.parse.com/docs/rest#queries-counting
        query_builder.count
      end

      # Find all SageNetwork::ApiRecord objects for that model.
      #
      # @return [Array] an `Array` of objects that subclass `SageNetwork::ApiRecord`.
      def all
        query_builder.all
      end

      # Find the first object. Fairly random, not based on any specific condition.
      #
      def first
        query_builder.limit(1).first
      end

      # Limits the number of objects returned
      #
      def limit(n)
        query_builder.limit(n)
      end

      # Skip the number of objects
      #
      def page(n)
        query_builder.page(n)
      end

      def order(*attr)
        query_builder.order(*attr)
      end

      def reorder(*attr)
        query_builder.reorder(*attr)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
