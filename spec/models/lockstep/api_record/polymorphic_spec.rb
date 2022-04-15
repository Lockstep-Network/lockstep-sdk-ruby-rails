require 'rails_helper'
require 'shared/auth'

RSpec.describe 'Lockstep::ApiRecord Polymorphic Test' do
  include_context 'auth/bearer_token'

  describe "polymorphic association" do

    it 'should fetch the associated polymorphic records' do
      VCR.use_cassette("models/lockstep/notes/contacts/find") do
        contact = Lockstep::Contact.find("331ef2fb-2af4-4bfb-a15d-3964b99cedc3")
        expect(contact.id.present?).to be_truthy
        notes = contact.notes
        expect(notes.present?).to be_truthy
        expect(notes.first.id.present?).to be_truthy
      end
    end
  end
end