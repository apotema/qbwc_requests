require 'spec_helper'

describe ItemPaymentQbxml do

  # it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do
    it "should create an add Item Payment xml" do
      item = Qbwc::Request::V07::ItemPayment.new(name: 'Payment item name')
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemPaymentAddRq requestID="request_id">
              <ItemPaymentAdd>
                <Name>Payment item name</Name>
              </ItemPaymentAdd>
            </ItemPaymentAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.add("request_id") ).to be_xml_equal_to xml
    end
  end

end
