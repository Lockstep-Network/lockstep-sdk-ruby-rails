require 'rails_helper'

RSpec.describe 'Lockstep::Query' do

  context 'when generating' do
    it 'should build with the correct params' do
      query =  Lockstep::Query.new(Lockstep::ApiRecord)
                                        .additional_query_params({'reportDate': Time.zone.today.strftime('%m/%d/%Y')})
                                        .where(domain_not_eq: 'lockstep.io', name: "test")
                                        .where(count_gteq: 20).where("email not_eq 'a@b.com'")
                                        .include_object(:contacts).limit(10)
                                        .page(2).order(name: :asc).with_count(true)
      params = query.build_params
      expect(params[:filter]).to eq("(((domain NE 'lockstep.io') AND (name eq 'test')) AND (count GE 20)) AND (email not_eq 'a@b.com')")
      expect(params[:pageSize]).to eq(10)
      expect(params[:pageNumber]).to eq(2)
      expect(params[:include]).to eq("contacts")
      expect(params[:order]).to eq("NAME asc")
      expect(params.key?(:reportDate)).to eq true
      expect(query.criteria[:with_count]).to eq true
    end
  end

end