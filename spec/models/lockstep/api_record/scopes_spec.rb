require 'rails_helper'

RSpec.describe 'Lockstep::ApiRecord Enum Spec' do

  let(:default_scope_klass) {
    Class.new(Lockstep::ApiRecord) do

      field :name
      field :meet
      field :greet

      default_scope { where(name: 'hello') }

      scope :meet, -> { where(meet: true) }
      scope :greet, -> { where(greet: true) }
    end
  }

  describe "default_scope" do
    it 'should append the default scope to all queries' do
      expect(default_scope_klass.where(name: "world").build_filter).to eq("(name eq 'hello') AND (name eq 'world')")
    end
  end

  describe 'scope' do
    it 'should define methods in the class for each of the scopes' do
      expect(default_scope_klass.respond_to?(:meet)).to be_truthy
      expect(default_scope_klass.respond_to?(:greet)).to be_truthy
    end

    it 'should allow chaining queries. All scoped queries should be merged' do
      expect(default_scope_klass.meet.greet.build_filter).to eq("((name eq 'hello') AND (meet eq true)) AND (greet eq true)")
      expect(default_scope_klass.where(name: 'world').meet.greet.build_filter).to eq("(((name eq 'hello') AND (name eq 'world')) AND (meet eq true)) AND (greet eq true)")
    end
  end

  describe 'unscoped' do
    it 'should clear all applied scopes' do
      expect(default_scope_klass.meet.greet.unscoped.criteria[:conditions].blank?).to be_truthy
      expect(default_scope_klass.meet.limit(1).unscoped.criteria[:limit].blank?).to be_truthy
    end
  end

  describe 'or' do
    it 'should generate the relevant OR query' do
      unscoped = default_scope_klass.unscoped
      filter = unscoped.where(meet: 1).or(unscoped.where(greet: 2)).build_filter
      expect(filter).to eq("(meet eq 1) OR (greet eq 2)")

      filter = unscoped.where(meet: 1).or(unscoped.where(greet: 2).where(name: 3)).build_filter
      expect(filter).to eq("(meet eq 1) OR ((greet eq 2) AND (name eq 3))")
    end
  end

end