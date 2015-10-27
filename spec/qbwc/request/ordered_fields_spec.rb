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

  describe '#has_one' do

    class SubModel
      include Qbwc::OrderedFields
      field :name
      validates :name, presence: true
    end

    before(:each) do
      OrderedFieldsImpl.has_one(:sub_model, SubModel)
      @sub_model = SubModel.new
      @of = OrderedFieldsImpl.new
      @of.sub_model = @sub_model
    end

    it "should add the class as a field" do
      expect(@of.sub_model).to be @sub_model
    end

    it "should validate the nested class" do
      expect(@of.valid?).to be false
    end

    it "should have the the nested class errors" do
      @of.valid?
      expect(@of.errors.count).to be 1
    end

    it "should have the the nested class list of errors" do
      @of.valid?
      expect(@of.errors.full_messages).to include("Sub model#name [\"can't be blank\"]")
    end

    it "validate the field class" do
      class InvalidModel
      end
      @of.sub_model = InvalidModel.new
      @of.valid?
      expect(@of.errors.full_messages).to(
        include("Sub model must be of type SubModel")
      )
    end

    it "should not validate if the field is empty" do
      @of.sub_model = nil
      @of.valid?
      expect(@of.errors.full_messages).to_not(
        include("Sub model must be of type SubModel")
      )
    end

  end

  describe '#ref_to' do

    before { OrderedFieldsImpl.ref_to :field }

    it 'should create a the accessor to the field with the _ref sufix' do
      expect(OrderedFieldsImpl.new).to respond_to(:field_ref)
      expect(OrderedFieldsImpl.new).to respond_to(:field_ref=)
    end

    it 'should add the field to attr_order list' do
      expect(OrderedFieldsImpl.attr_order).to include :field_ref
    end

    it 'should validate the presece of only list_id or full_name' do
      ordered_fields = OrderedFieldsImpl.new
      ordered_fields.field_ref = "invalid_string"
      expect(ordered_fields.valid?).to be false
      expect(ordered_fields.errors.full_messages).to(
        include "Field ref Must have the format {list_id: 'value'} or {full_name: 'value'}"
      )
    end

    it 'should only accept LIST_ID or FULL_NAME not both' do
      ordered_fields = OrderedFieldsImpl.new
      ordered_fields.field_ref = {list_id: "10", full_name: "Full name"}
      expect(ordered_fields.valid?).to be false
      expect(ordered_fields.errors.full_messages).to(
        include "Field ref Must have list_id or full_name"
      )
    end

    it 'should only accept LIST_ID or FULL_NAME not both' do
      ordered_fields = OrderedFieldsImpl.new
      ordered_fields.field_ref = {list_id: "10"}
      expect(ordered_fields.valid?).to be true
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
