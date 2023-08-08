# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SageNetwork::Status do
  describe 'SageNetwork::Status#ping' do
    subject(:result) { described_class.ping }

    it 'returns true when status is "pong"' do
      VCR.use_cassette('models/sage_network/status/ping') do
        expect(result).to be true
      end
    end
  end

  describe 'SageNetwork::Status#app_info' do
    subject(:result) { described_class.app_info }

    it 'returns the app-info as a symbolized hash' do
      VCR.use_cassette('models/sage_network/status/app_info') do
        expect(result).to be_a Hash

        %i[environment runtime_environment version version_hash].each do |key|
          expect(result[key]).to be_present
        end
      end
    end
  end

  describe 'SageNetwork::Status#health' do
    subject(:result) { described_class.health }

    it 'returns the health as a symbolized hash' do
      VCR.use_cassette('models/sage_network/status/health') do
        expect(result).to be_a Hash

        # expect(result[:status]).to eq('Healthy') # TODO: Update this when the API is actually Healthy!
        expect(result[:total_duration]).to be_present
        expect(result[:details]).to be_a Hash

        [:application, :"application database", :"ledger api"].each do |key|
          expect(result[:details][key]).to be_a Hash

          # expect(result[:details][key][:status]).to eq('Healthy') # TODO: Update this when the API is actually Healthy!
          expect(result[:details][key][:duration]).to be_present
          expect(result[:details][key][:data]).to be_a Hash
          # expect(result[:details][key][:description]).to be_blank # TODO: Update this when the API is actually Healthy!
        end
      end
    end
  end
end
