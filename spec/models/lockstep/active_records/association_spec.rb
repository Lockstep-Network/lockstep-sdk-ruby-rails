require 'rails_helper'
require 'shared/auth'

RSpec.describe 'Lockstep::ActiveRecords::Association' do
  include_context 'auth/bearer_token'

  let(:model_klass) {
    Class.new do
      include Lockstep::ActiveRecords::Association

      lockstep_has_many :contacts, class_name: 'Lockstep::Contact', primary_key: 'connection_id', foreign_key: 'company_id'
      lockstep_belongs_to :user, class_name: 'Lockstep::User', primary_key: 'user_id', foreign_key: 'lockstep_user_id'

      # Contact primary_key
      def connection_id
        "17544da8-7be8-4ee2-8c62-cbd81428c68b"
      end

      # User foreign_key
      def lockstep_user_id
        "19a23e59-8dce-47e5-a114-02cfe8872e53"
      end

    end
  }

  let(:model) { model_klass.new }

  describe "#has_many" do
    it 'should fetch the associated records' do
      VCR.use_cassette("models/lockstep/contacts/where") do
        contacts = model.contacts
        expect(contacts.present?).to be_truthy
        expect(contacts.class).to eq(Lockstep::RelationArray)
      end
    end
  end

  describe "#belongs_to" do
    it 'should find the record if the id exists' do
      VCR.use_cassette("models/lockstep/users/find") do
        user = model.user
        expect(user.present?).to be_truthy
        expect(user.class).to eq(Lockstep::User)
      end
    end
  end
end