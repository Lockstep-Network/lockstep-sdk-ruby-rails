require 'rails_helper'
require 'shared/auth'

RSpec.describe 'Lockstep::ApiRecord Association Spec' do
  include_context 'auth/bearer_token'

  describe 'has_many' do
    context 'RelationArray' do
      it 'should return empty RelationArray if no records are present' do
        VCR.use_cassette('models/lockstep/connections/create') do
          connection = Lockstep::Connection.create({ company_name: 'Test Company' })
          expect(connection.id.present?).to be_truthy
          expect(connection.contacts.blank?).to be_truthy
          expect(connection.contacts.class).to eq(Lockstep::RelationArray)
        end
      end
    end

    context 'included=true' do
      it 'should fetch all records when included with the parent record' do
        connections = nil
        VCR.use_cassette('models/lockstep/connections/where_with_contacts') do
          connections = Lockstep::Connection.include_object(:contacts).limit(10).execute
          expect(connections.size > 1).to be_truthy
        end

        # testing outside VCR to ensure no network call is made for the associations
        expect(connections.first.contacts.size > 1).to be_truthy
        expect(connections.first.contacts.first.id.present?).to be_truthy
      end
    end

    context 'included=false' do
      # TODO : No example to implement this as of now
    end

    context '#create' do
      it 'should create a new child record when #create is called' do
        connection = nil
        VCR.use_cassette('models/lockstep/connections/create') do
          connection = Lockstep::Connection.create({ company_name: 'Test Company' })
          expect(connection.id.present?).to be_truthy
          expect(connection.contacts.blank?).to be_truthy
          expect(connection.contacts.class).to eq(Lockstep::RelationArray)
        end

        VCR.use_cassette('models/lockstep/connections/contacts/create') do
          contact = connection.contacts.create({ email_address: 'x@y.com' })
          expect(contact.id.present?).to be_truthy
          expect(contact.company_id).to eq(connection.id)
          expect(connection.contacts.size).to eq(1)
        end
      end
    end

    context '#new' do
      it 'should return a new child record when #new is called' do
        connection = nil
        VCR.use_cassette('models/lockstep/connections/create') do
          connection = Lockstep::Connection.create({ company_name: 'Test Company' })
          expect(connection.id.present?).to be_truthy
          expect(connection.contacts.blank?).to be_truthy
          expect(connection.contacts.class).to eq(Lockstep::RelationArray)
        end

        contact = connection.contacts.new({ email_address: 'x@y.com' })
        expect(contact.id.present?).to be_falsey
        expect(contact.persisted?).to be_falsey
        expect(contact.company_id).to eq(connection.id)
        expect(connection.contacts.size).to eq(1)
      end
    end
  end

  describe 'belongs_to' do
    context 'included=true' do
      # TODO : No example to implement this as of now
    end

    context 'included=false' do
      it 'should fetch the association when called' do
        contact = nil
        VCR.use_cassette('models/lockstep/contacts/find') do
          id = '6e634a6a-0f5a-490a-818e-b16d4c1ba3e8'
          contact = Lockstep::Contact.find(id)
        end

        VCR.use_cassette('models/lockstep/contacts/connection/find') do
          connection = contact.connection
          expect(connection.class).to eq(Lockstep::Connection)
          expect(connection.id).to eq(contact.company_id)
        end
      end
    end
  end
end
