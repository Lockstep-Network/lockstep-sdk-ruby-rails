require 'rails_helper'

RSpec.describe 'Lockstep::ApiRecord Enum Spec' do

  describe "enum" do

    let(:enum_klass) {
      Class.new(Lockstep::ApiRecord) do
        field(:status)

        enum status: [:active, :inactive]
      end
    }

    let(:enum_klass_hash) {
      Class.new(Lockstep::ApiRecord) do
        field(:status)

        enum status: { :active => 1, :inactive => 2}
      end
    }

    it 'should allow defining enums with hash' do
      record = enum_klass_hash.new(status: :active)
      expect(record.status).to eq("active")
      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
    end

    it 'should allow defining enums with array' do
      record = enum_klass.new(status: :active)
      expect(record.status).to eq("active")
      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
    end

    it 'should allow creating record with enum keys' do
      record = enum_klass_hash.new(status: :active)
      expect(record.status).to eq("active")
      expect(record.get_attribute(:status)).to eq(1)
      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
    end

    it 'should allow creating record with enum values' do
      record = enum_klass_hash.new(status: 1)
      expect(record.status).to eq("active")
      expect(record.get_attribute(:status)).to eq(1)
      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
    end

    it 'should create a setter for setting the value, which should persist the record if the record is already saved' do
      record = enum_klass_hash.new(status: 1)
      expect(record).to receive(:save).and_return(true)
      expect(record).to receive(:persisted?).and_return(true)
      # expect(record).to receive(:save)

      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
      record.inactive!
      expect(record.active?).to be_falsey
      expect(record.inactive?).to be_truthy
    end

    it 'should create a setter for setting the value, which should not persist the record if the record is not saved' do
      record = enum_klass_hash.new(status: 1)
      expect(record).not_to receive(:save)

      expect(record.active?).to be_truthy
      expect(record.inactive?).to be_falsey
      expect(record.persisted?).to be_falsey
      record.inactive!
      expect(record.active?).to be_falsey
      expect(record.inactive?).to be_truthy
      expect(record.persisted?).to be_falsey
    end

  end
end