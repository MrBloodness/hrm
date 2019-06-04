require 'rails_helper'

RSpec.describe 'FactoryGirl' do
  FactoryGirl.factories.each do |factory|
    describe ".build(:#{factory.name})" do
      it 'returns valid record' do
        record = build factory.name
        expect(record.valid?).to be_truthy,
          "#{record.class.name}: #{record.errors.full_messages.join(',')}"
      end
    end
  end
end
