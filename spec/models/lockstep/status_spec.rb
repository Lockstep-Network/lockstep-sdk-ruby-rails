require 'rails_helper'

RSpec.describe Lockstep::Status do
  subject(:result) { described_class.ping }

  context 'when getting status via bearer token' do
    describe 'when no bearer token is present' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/no_bearer') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           "No bearer token found in header 'Authorization' and no API key found in header 'Api-Key'")
        end
      end
    end

    describe 'when bearer token present is expired' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/expired_bearer') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           "The token expired at '08/22/2022 15:46:00'")
        end
      end
    end

    describe 'when bearer token present is an invalid jwt' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/invalid_bearer') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           'The token is not a valid JWT format: <some_invalid_token>')
        end
      end
    end

    describe "when bearer token present is for user that's read-only" do
      it 'returns valid status hash' do
        VCR.use_cassette('models/lockstep/status/read_only_status') do
          expect(result).to be_present
          expect(result[:user_name]).to eq 'Tejas Shetty'
          expect(result[:roles]).to eq ['Read-Only']
          expect(result[:logged_in]).to be true
          expect(result[:error_message]).to be_nil
          expect(result.keys.all? { |k| k.downcase == k }).to be true
        end
      end
    end

    describe "when bearer token present is for user that's atleast a member" do
      it 'returns valid status hash' do
        VCR.use_cassette('models/lockstep/status/member_status') do
          expect(result).to be_present
          expect(result[:user_name]).to eq 'Tejas Shetty'
          expect(result[:roles]).to eq ['Member']
          expect(result[:logged_in]).to be true
          expect(result[:error_message]).to be_nil
          expect(result.keys.all? { |k| k.downcase == k }).to be true
        end
      end
    end
  end

  context 'getting status via api key' do
    describe 'when no api key is present' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/no_api_key') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           "No bearer token found in header 'Authorization' and no API key found in header 'Api-Key'")
        end
      end
    end

    describe 'when api key present is expired' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/expired_api_key') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           'This API key is not valid, it may have been revoked. If you believe this is an error, contact support.')
        end
      end
    end

    describe 'when api key present is an invalid' do
      it 'throws Lockstep::Exceptions::UnauthorizedError' do
        VCR.use_cassette('models/lockstep/status/invalid_api_key') do
          expect { result }.to raise_error(Lockstep::Exceptions::UnauthorizedError,
                                           'This API key is not valid, it may have been revoked. If you believe this is an error, contact support.')
        end
      end
    end

    describe "when api key present is for user that's read-only" do
      it 'returns valid status hash' do
        VCR.use_cassette('models/lockstep/status/read_only_ak_status') do
          expect(result).to be_present
          expect(result[:user_name]).to eq 'Tejas Shetty'
          expect(result[:roles]).to eq ['Read-Only']
          expect(result[:logged_in]).to be true
          expect(result[:error_message]).to be_nil
          expect(result.keys.all? { |k| k.downcase == k }).to be true
        end
      end
    end

    describe "when api key present is for user that's atleast a member" do
      it 'returns valid status hash' do
        VCR.use_cassette('models/lockstep/status/member_ak_status') do
          expect(result).to be_present
          expect(result[:user_name]).to eq 'Tejas Shetty'
          expect(result[:roles]).to eq ['Member']
          expect(result[:logged_in]).to be true
          expect(result[:error_message]).to be_nil
          expect(result.keys.all? { |k| k.downcase == k }).to be true
        end
      end
    end
  end
end
