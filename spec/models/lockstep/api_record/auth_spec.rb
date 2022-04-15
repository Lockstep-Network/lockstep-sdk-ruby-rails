require "rails_helper"
require "shared/auth"

RSpec.describe "Lockstep::ApiRecord Auth Spec" do
  include_context "auth/bearer_token"

  describe "authentication" do
    context "when auth token is not set" do
      before do
        Lockstep::Client.set_bearer_token(nil)
      end

      it "should throw 401 error" do
        expect(Lockstep::Client.bearer_token.blank?).to be_truthy
        VCR.use_cassette("models/lockstep/api_record/auth/without_token") do
          expect { Lockstep::Contact.find("249013e5-3aef-40f7-a99e-009dd64aadef") }.to raise_error(/401/)
        end
      end
    end

    context "when auth token is not set" do
      it "should return 200" do
        VCR.use_cassette("models/lockstep/api_record/auth/valid_token") do
          expect(Lockstep::Client.api_key.present?).to be_truthy
          id = "249013e5-3aef-40f7-a99e-009dd64aadef"
          contact = Lockstep::Contact.find(id)
          expect(contact.class).to eq(Lockstep::Contact)
          expect(contact.id.present?).to be_truthy
        end
      end
    end
  end
end
