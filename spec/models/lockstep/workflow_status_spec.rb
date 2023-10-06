# frozen_string_literal: true

require 'rails_helper'
require './spec/shared/auth'

RSpec.describe 'Lockstep::WorkflowStatus' do
  include_context 'auth/bearer_token'

  describe 'when creating a new workflow status' do
    let(:workflow_status) { Lockstep::WorkflowStatus.new name: 'TestCase Step 1' }

    it 'should create a new workflow status on platform' do
      VCR.use_cassette('workflow_status/create') do
        expect(workflow_status.save).to be true
        expect(Lockstep::WorkflowStatus.find(workflow_status.id).name).to eq('TestCase Step 1')
      end
    end
  end

  describe 'when fetching all workflow statuses' do
    let(:workflow_statuses) { Lockstep::WorkflowStatus.all }

    it 'should return all workflow statuses' do
      VCR.use_cassette('workflow_status/all') do
        expect(workflow_statuses).to be_an_instance_of(Array)
        expect(workflow_statuses.size).to eq 3
      end
    end
  end

  describe 'when fetching one workflow status with no parent' do
    let(:workflow_status) { Lockstep::WorkflowStatus.find('some-id') }

    it 'should return workflow status' do
      VCR.use_cassette('workflow_status/find') do
        expect(workflow_status).to be_present
        expect(workflow_status.parent_workflow_status).to be_nil
      end
    end
  end

  describe 'when fetching one workflow status with parent and calling that parent using parent_workflow_status relation' do
    let(:workflow_status) { Lockstep::WorkflowStatus.find('some-id') }

    it 'should return workflow status' do
      VCR.use_cassette('workflow_status/find-multiple') do
        expect(workflow_status).to be_present
        expect(workflow_status.parent_workflow_status).to be_present
      end
    end
  end
end
