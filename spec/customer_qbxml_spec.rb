require 'spec_helper'

describe CustomerQbxml do

  describe CustomerQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe CustomerQbxml::Add do

    it { is_expected.to validate_field_presence_of :name }

    context "valid customer" do
      let(:customer){ CustomerQbxml::Add.factory(name: 'a') }

      it "should create an add customer xml" do
        xml = <<-XML
          <?xml version="1.0" encoding="ISO-8859-1"?>
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
        expect( customer.to_xml("request_id") ).to be_xml_equal_to xml
      end
    end

    context "invalid customer" do
      let(:customer){ CustomerQbxml::Add.factory(name: 'a', middle_name: '123456') }

      it "should report an error in the main object" do
        expect(customer.valid?).to eq(false)
        expect(customer.errors.count).to eq(1)
        expect(customer.errors.full_messages[0]).to eq('Middle name is too long (maximum is 5 characters)')
      end
    end

    context "invalid customer address" do
      let(:bill_address){ QbwcRequests::SubModels::Address.new(postal_code: '0123456789012345') }
      let(:customer){ CustomerQbxml::Add.factory(bill_address: bill_address) }

      it "it should report an error in a child object" do
        expect(customer.valid?).to eq(false)
        expect(customer.errors.count).to eq(2)
        expect(customer.errors.full_messages).to include("Name can't be blank")
      end
    end

  end

end
