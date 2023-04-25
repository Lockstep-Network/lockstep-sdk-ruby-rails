require 'rails_helper'

RSpec.describe 'Lockstep::User' do

  context 'when calling User Invite to invite a user' do
    it 'should return true as the email is not present already' do
      VCR.use_cassette("models/lockstep/user/exist") do
        response = Lockstep::User.invite(["abcd@gmail.com"])
        expect(response.first.persisted?).to eq(true)
        expect(response.first.user_id).to be_present
        expect(response.first.group_key).to be_present
        expect(response.first.user_name).to be_present
        expect(response.first.email).to be_present
        expect(response.first.status).to be_present
        expect(response.first.created).to be_present
        expect(response.first.created_user_id).to be_present
        expect(response.first.modified).to be_present
        expect(response.first.modified_user_id).to be_present
        expect(response.first.user_role).to be_present
        expect(response.first.invite_sent).to be_present
      end
    end

    it 'should return false as the email is already registered' do
      VCR.use_cassette("models/lockstep/user/does_not_exist") do
        response = Lockstep::User.invite( ["su5mitsourav@gmail.com"] )
        expect(response.first.persisted?).to eq(false)
      end
    end

    it 'throws Lockstep::Exceptions::UnauthorizedError' do
      VCR.use_cassette('models/lockstep/user/no_api_key') do
        expect { Lockstep::User.invite( ["su5mitsourav@gmail.com"] ) }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                         "Unauthorized")
      end
    end
  end
end
