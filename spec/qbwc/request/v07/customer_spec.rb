require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Customer do

  it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do

    context "valid customer" do
      let(:customer){ Qbwc::Request::V07::Customer.new(name: 'a') }

      it "should create an add customer xml" do
        xml = <<-XML
          <?xml version='1.0' encoding='utf-8'?>
          <?qbxml version="7.0"?>
          <QBXML>
            <QBXMLMsgsRq onError="stopOnError">
              <CustomerAddRq requestID="request_id">
                <CustomerAdd>
                  <Name>a</Name>
                </CustomerAdd>
              </CustomerAddRq>
            </QBXMLMsgsRq>
          </QBXML>
        XML
        expect( customer.add("request_id") ).to be_xml_equal_to xml
      end
    end

    context "invalid customer" do
      let(:customer){ Qbwc::Request::V07::Customer.new(name: 'a', middle_name: '123456') }

      it "should report an error in the main object" do
        expect(customer.valid?).to eq(false)
        expect(customer.errors.count).to eq(1)
        expect(customer.errors.full_messages[0]).to eq('Middle name is too long (maximum is 5 characters)')
      end
    end

    context "invalid customer address" do
      let(:bill_address){ Qbwc::Request::V07::Address.new(postal_code: '0123456789012345') }
      let(:customer){ Qbwc::Request::V07::Customer.new(bill_address: bill_address) }

      it "it should report an error in a child object" do
        expect(customer.valid?).to eq(false)
        expect(customer.errors.count).to eq(1)
        expect(customer.errors.full_messages[0]).to eq("Name can't be blank")
      end
    end

  end

end
