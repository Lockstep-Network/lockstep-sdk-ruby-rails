require 'rails_helper'

RSpec.describe 'Lockstep::FeatureFlag' do

  context 'when generating' do
    it 'should return 401 since api key not set' do
      VCR.use_cassette("models/lockstep/feature_flag/exist") do
        response =  Lockstep::FeatureFlag.create({ names: ["Inbox.GlobalSearch"] })
        expect(response.code).eql?(200)
        expect(response.attributes.values).eql?(true)
      end
    end

    it 'should return 404 since internal key not set' do
      VCR.use_cassette("models/lockstep/feature_flag/does_not_exist") do
        response =  Lockstep::FeatureFlag.create({ names: ["Inbox.GlobalSearch1"] })
        expect(response.attributes.values).eql?(false)
      end
    end
  end
end
