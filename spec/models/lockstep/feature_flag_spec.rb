require 'rails_helper'

RSpec.describe 'Lockstep::FeatureFlag' do

  context 'when calling feature flag' do
    it 'should return true for the feature flag name' do
      VCR.use_cassette("models/lockstep/feature_flag/exist") do
        response = Lockstep::FeatureFlag.create({ names: ["Inbox.GlobalSearch1"] })
        expect(response.attributes.values).eql?(true)
      end
    end

    it 'should return false for the feature flag name' do
      VCR.use_cassette("models/lockstep/feature_flag/does_not_exist") do
        response = Lockstep::FeatureFlag.create({ names: ["Inbox.GlobalSearch1"] })
        expect(response.attributes.values).eql?(false)
      end
    end
  end
end
