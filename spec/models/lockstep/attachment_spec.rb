require 'rails_helper'

RSpec.describe 'Lockstep::Attachment' do

  context 'when attachment is present' do
    it 'should return the list of attachments' do
      VCR.use_cassette("models/lockstep/attachment/success") do
        response = Lockstep::Attachment.first.as_json

        expect(response).not_to be_nil
        %i[
          group_key attachment_id table_key object_key
          file_name file_ext attachment_type
        ].each do |attr|
          expect(response[attr.to_s]).to be_present
        end
      end
    end

    it 'should return the list of W9 type attachments' do
      VCR.use_cassette("models/lockstep/attachment/query_success") do
        response = Lockstep::Attachment.where(attachment_type: "W-9").execute.as_json

        expect(response).not_to be_nil
        expect(response.count).not_to eq 0
        attachment_type = response.pluck("attachment_type").uniq
        expect(attachment_type.count).to eq 1
        expect(attachment_type.first).to eq "W-9"
      end
    end
  end
end
