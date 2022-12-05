require 'rails_helper'

RSpec.describe 'Lockstep::MagicLink' do

  context 'when generating' do
    it 'should return 401 since api key not set' do
      VCR.use_cassette("models/lockstep/magic_links/unauthorized") do
        response =  Lockstep::MagicLink.generate('user@email.com', 720, "dummy-app-id", "dummy-user-role", nil)
        expect(response.code).eql?(401)
      end
    end

    it 'should return 404 since internal key not set' do
      VCR.use_cassette("models/lockstep/magic_links/unauthorized_internal_key") do
        Lockstep::Client.set_bearer_token("dummy-token")
        response =  Lockstep::MagicLink.generate('user@email.com', 720, "dummy-app-id", "dummy-user-role", nil)
        expect(response.code).eql?(404)
      end
    end

    it 'should return magic_link for an user of self service portal' do
      VCR.use_cassette("models/lockstep/magic_links/magic_link") do
        Lockstep::Client.set_internal_service_key("dummy-internal-service-key")
        Lockstep::Client.set_bearer_token("dummy-token")
        response =  Lockstep::MagicLink.generate('user@email.com', 720, "dummy-app-id", "dummy-user-role", nil)
        eval(response.body).has_key?(:magicLinkUrl)
        expect(response.code).eql?(200)
      end
    end
  end
end