require 'spec_helper'

# Specs for Qbwc::OrderedFields
describe Qbwc::OrderedFields do

  let(:ordered_fields) {
    object = Object.new
    object.class.include(Qbwc::OrderedFields)
  }

  describe '#field' do

    before { ordered_fields.field(:some_field) }

    it 'should add a field to the object att_accessors' do
      ordered_fields.some_field = "10"
      expect(ordered_fields.some_field).to eql "10"
    end

    it 'should add a field the list object attributes' do
      expect(ordered_fields.attr_order.first).to eql :some_field
    end
    
  end

end
