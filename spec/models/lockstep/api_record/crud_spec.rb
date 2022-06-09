require "rails_helper"
require "shared/auth"

RSpec.describe "Lockstep::ApiRecord CRUD Test" do
  include_context "auth/bearer_token"

  describe "#find" do
    it "should find the record if the id exists" do
      VCR.use_cassette("models/lockstep/contacts/find") do
        id = "249013e5-3aef-40f7-a99e-009dd64aadef"
        contact = Lockstep::Contact.find(id)
        expect(contact.class).to eq(Lockstep::Contact)
        expect(contact.id.present?).to be_truthy
      end
    end

    it "should throw 404 exception if the ID does not exist" do
      VCR.use_cassette("models/lockstep/contacts/find_invalid_id") do
        expect { Lockstep::Contact.find("249013e5-3aef-40f7-a99e-009dd64aadea") }.to raise_error(Lockstep::Exceptions::RecordNotFound)
      end
    end
  end

  describe "#find_by" do
    it "should find the record if the id exists" do
      VCR.use_cassette("models/lockstep/contacts/find") do
        id = "249013e5-3aef-40f7-a99e-009dd64aadef"
        contact = Lockstep::Contact.find_by(contact_id: id)
        expect(contact.class).to eq(Lockstep::Contact)
        expect(contact.id.present?).to be_truthy
      end
    end

    it "returns nil if the record does not exist" do
      VCR.use_cassette("models/lockstep/contacts/find_invalid_id") do
        expect(Lockstep::Contact.find_by(contact_id: "249013e5-3aef-40f7-a99e-009dd64aadea").nil?).to be_truthy
      end
    end
  end

  describe "#find_by_id" do
    it "should find the record if the id exists" do
      VCR.use_cassette("models/lockstep/contacts/find") do
        id = "249013e5-3aef-40f7-a99e-009dd64aadef"
        contact = Lockstep::Contact.find_by_contact_id(id)
        expect(contact.class).to eq(Lockstep::Contact)
        expect(contact.id.present?).to be_truthy
      end
    end

    it "returns nil if the record does not exist" do
      VCR.use_cassette("models/lockstep/contacts/find_invalid_id") do
        expect(Lockstep::Contact.find_by_contact_id("249013e5-3aef-40f7-a99e-009dd64aadea").nil?).to be_truthy
      end
    end
  end

  describe "#where" do
    it "should return RelationArray if records are present" do
      VCR.use_cassette("models/lockstep/contacts/where") do
        query = Lockstep::Contact.where(company_id: "17544da8-7be8-4ee2-8c62-cbd81428c68b")
        expect(query.class).to eq(Lockstep::Query)
        contacts = query.execute
        expect(contacts.class).to eq(Array)
        expect(contacts.present?).to be_truthy
        expect(contacts.size > 0).to be_truthy
      end
    end
  end

  describe "#count" do
    it "should return RelationArray if records are present" do
      VCR.use_cassette("models/lockstep/contacts/count") do
        count = Lockstep::Contact.where(company_id: "17544da8-7be8-4ee2-8c62-cbd81428c68b").count
        expect(count > 0).to be_truthy
      end
    end
  end

  describe "#create" do
    it "should have error messages attached if the record is invalid" do
      VCR.use_cassette("models/lockstep/contacts/create_invalid") do
        contact = Lockstep::Contact.create email_address: "a"
        expect(contact.persisted?).to be_falsey
        expect(contact.errors.full_messages.present?).to be_truthy
      end
    end

    it "should persist if the record is valid" do
      VCR.use_cassette("models/lockstep/contacts/create") do
        contact = Lockstep::Contact.create email_address: "a@b.com"
        expect(contact.persisted?).to be_truthy
        expect(contact.errors.full_messages.blank?).to be_truthy
        expect(contact.id.present?).to be_truthy
      end
    end
  end

  describe "#bulk_import" do
    it "should return false and have error messages attached if the request is invalid" do
      VCR.use_cassette("models/lockstep/contacts/bulk_import_invalid") do
        Lockstep::Client.set_api_key('LSPK-PC/Ywx1A0tJz4QKmbuu5SRj5W0PLxRy4ZDQZriNM/kIG93Ci2u7MBjomzIktix4joPn4zkERt2ctazNULLWopw==')
        obj1 = Lockstep::Connection.new email_address: "a@b.com" # Valid object
        obj2 = Lockstep::Contact.new email_address: "$$$$a", is_active: 2  # Invalid object
        expect { Lockstep::Contact.bulk_import([obj1, obj2]) } .to raise_error(Lockstep::Exceptions::BadRequestError)
      end
    end

    it "should return true and persist if the objects are valid" do
      VCR.use_cassette("models/lockstep/contacts/bulk_import") do
        obj1 = Lockstep::Contact.new email_address: "a@b.com"
        obj2 = Lockstep::Contact.new email_address: "a2@b.com"
        obj = Lockstep::Contact.bulk_import([obj1, obj2])
        expect(obj1.errors.full_messages.blank?).to be_truthy
        expect(obj1.persisted?).to be_truthy
        expect(obj1.id.present?).to be_truthy
        expect(obj2.errors.full_messages.blank?).to be_truthy
        expect(obj2.persisted?).to be_truthy
        expect(obj2.id.present?).to be_truthy
      end
    end
  end

  describe "#update" do
    it "should update if the update is valid" do
      VCR.use_cassette("models/lockstep/contacts/update") do
        old_email = "x@a.com"
        email = "x@b.com"
        contact = Lockstep::Contact.find("249013e5-3aef-40f7-a99e-009dd64aadef")
        expect(contact.update(email_address: old_email)).to be_truthy
        expect(contact.email_address).to eq(old_email)
        expect(contact.update(email_address: email)).to be_truthy
        expect(contact.email_address).to eq(email)
      end
    end

    # TODO: Bug in platform API is allowing update without validations
    # it 'should return error if the update is invalid' do
    #   VCR.use_cassette("models/lockstep/contacts/update_invalid") do
    #     email = "x"
    #     contact = Lockstep::Contact.find("249013e5-3aef-40f7-a99e-009dd64aadef")
    #     expect(contact.email_address).to_not eq(email)
    #     expect(contact.update(email_address: email)).to be_falsey
    #     expect(contact.email_address).to not_eq(email)
    #     expect(contact.errors.full_messages.present?).to be_truthy
    #   end
    # end
  end

  describe "#destroy" do
    it "should destroy" do
      VCR.use_cassette("models/lockstep/contacts/destroy") do
        contact = Lockstep::Contact.create(email_address: "test@test.com")
        expect(contact.is_active).to be_truthy
        expect(contact.destroy).to be_truthy
        expect(contact.is_active).to be_falsey
      end
    end
  end

  describe '#chunk' do

    it 'should fetch records in batches' do
      VCR.use_cassette("models/lockstep/contacts/chunk") do
        resource = Lockstep::Contact.resource
        Lockstep::Contact.stub(:resource).and_return(resource)
        expect_any_instance_of(Lockstep::Client).to receive(:get).exactly(3).times.and_call_original
        results =  Lockstep::Contact.limit(5).chunk(2).execute
        expect(results.size).to eq(5)
      end
    end

  end
end
