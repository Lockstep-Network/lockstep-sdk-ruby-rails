require 'rails_helper'

RSpec.describe 'Lockstep::MagicLink' do

  context 'when generating' do
    it 'should return 401 since api key not set' do
      VCR.use_cassette("models/lockstep/magic_links/unauthorized") do
        response =  Lockstep::MagicLink.generate('vivek.a@lockstep.io', 720, "00000000-0000-0000-0003-000000000001", "00000000-0000-0000-0000-000000000003")
        expect(response.code).eql?(401)
      end
    end

    it 'should return 404 since internal key not set' do
      VCR.use_cassette("models/lockstep/magic_links/unauthorized_internal_key") do
        Lockstep::Client.set_bearer_token("dummykey123")
        response =  Lockstep::MagicLink.generate('vivek.a@lockstep.io', 720, "dummy-app-id", "dummy-user-role")
        expect(response.code).eql?(404)
      end
    end

    it 'should return magic_link for an user of self service portal' do
      VCR.use_cassette("models/lockstep/magic_links/magic_link") do
        Lockstep::Client.set_internal_service_key("dummykey123")
        Lockstep::Client.set_bearer_token("dummytoken123")
        response =  Lockstep::MagicLink.generate('vivek.a@lockstep.io', 720, "dummy-app-id", "dummy-user-role")
        eval(response.body).has_key?(:magicLinkUrl)
        expect(response.code).eql?(200)
      end
    end
  end
end