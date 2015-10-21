require 'spec_helper'

describe Qbwc::OrderedFields do

  class OrderedFieldsImpl
    include Qbwc::OrderedFields
  end

  let(:ordered_field) { 
    OrderedFieldsImpl.new 
  }

  describe '#field' do

    before { OrderedFieldsImpl.field(:some_field) }

    it 'should add a field to the object att_accessors' do
      ordered_field.some_field = "10"
      expect(ordered_field.some_field).to eql "10"
    end

    it 'should add a field the list object attributes' do
      expect(OrderedFieldsImpl.attr_order.first).to eql :some_field
    end
    
  end

  describe '#ordered_fields' do

    context 'empty fields' do

      it 'should return a hash' do
        expect(ordered_field.ordered_fields).to be_kind_of(Hash)
      end

    end

    context 'populated fields' do

      it 'should return a hash with all the fields and its values' do
        OrderedFieldsImpl.field(:some_field)
        ordered_field.some_field = "20"
        expect(ordered_field.ordered_fields).to eql({some_field: "20"})
      end
    
    end

  end

end
