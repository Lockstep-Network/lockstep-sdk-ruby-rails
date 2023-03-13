require 'rails_helper'

RSpec.describe 'Lockstep::ReportDailyPayableOutstandingSummary' do

  context 'when generating' do
    it 'should return the payable summry for the account' do
      VCR.use_cassette("models/lockstep/report_daily_payable_outstanding_summary/success") do
        response = Lockstep::ReportDailyPayableOutstandingSummary.with_report_date("03/31/23").execute.as_json

        expect(response).not_to be_nil
        expect(response.length).not_to eq 0
        %i[
          group_key vendor_id vendor_name primary_contact
          bills base_currency_code amount_outstanding dpo
        ].each do |attr|
          expect(response.first[attr.to_s]).to be_present
        end
      end
    end
  end
end