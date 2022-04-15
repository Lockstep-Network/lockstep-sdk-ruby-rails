module Lockstep::ApiRecords::Scopes
  extend ActiveSupport::Concern

  class_methods do
    def scopes
      @scopes ||= {}
    end

    def default_scope(&block)
      scopes[:default_scope] = block if block_given?
      scopes[:default_scope]
    end

    def scope(name, block)
      scopes[name] = block
      define_singleton_method name, &block
    end
  end

end