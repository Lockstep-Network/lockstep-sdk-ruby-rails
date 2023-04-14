require 'rails_helper'

RSpec.describe 'Lockstep::User' do

  context 'when calling feature flag' do
    it 'should return true as the email is not present already' do
      VCR.use_cassette("models/lockstep/user/exist") do
        response = Lockstep::User.invite(["abc@gmail.com"])
        expect(response.first['success']).eql?(true)
      end
    end

    it 'should return false as the email is already registered' do
      VCR.use_cassette("models/lockstep/user/does_not_exist") do
        response = Lockstep::User.invite( ["su5mitsourav@gmail.com"] )
        expect(response.first['success']).eql?(false)
      end
    end

    it 'throws Lockstep::Exceptions::UnauthorizedError' do
      VCR.use_cassette('models/lockstep/user/no_api_key') do
        expect { Lockstep::User.invite( ["su5mitsourav@gmail.com"] ) }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                         "Unauthorized: Check your App ID & Master Key")
      end
    end
  end
end
