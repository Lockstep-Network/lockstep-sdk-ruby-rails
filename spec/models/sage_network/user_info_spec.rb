# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SageNetwork::UserInfo do
  describe 'SageNetwork::Status#get' do
    subject(:result) { described_class.get }

    describe 'when bearer token is not set' do
    end

    describe 'when bearer token is set' do
    end
  end
end
