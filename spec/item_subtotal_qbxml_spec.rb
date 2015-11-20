require 'spec_helper'

describe ItemSubtotalQbxml do

  describe ItemSubtotalQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe ItemSubtotalQbxml::Add do

    it { is_expected.to validate_field_presence_of :name }

    let(:item) { ItemSubtotalQbxml::Add.factory(name: 'Subtotal item name') }
    let(:item_with_bar_code) { ItemSubtotalQbxml::Add.factory(name: 'Subtotal item name', bar_code: { bar_code_value: 'some bar code value' } ) }

    it "should create an add Item Subtotal xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemSubtotalAddRq requestID="request_id">
              <ItemSubtotalAdd>
                <Name>Subtotal item name</Name>
              </ItemSubtotalAdd>
            </ItemSubtotalAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.to_xml("request_id") ).to be_xml_equal_to xml
    end

    it "should create an add Item Subtotal with the bar_code" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemSubtotalAddRq requestID="request_id">
              <ItemSubtotalAdd>
                <Name>Subtotal item name</Name>
                <BarCode>
                  <BarCodeValue>some bar code value</BarCodeValue>
                </BarCode>
              </ItemSubtotalAdd>
            </ItemSubtotalAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item_with_bar_code.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end
end
