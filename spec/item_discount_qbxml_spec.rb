require 'spec_helper'

describe ItemDiscountQbxml do

  describe ItemDiscountQbxml::Query do
    it_behaves_like 'queryable'
  end
  
  describe ItemDiscountQbxml::Add do

    it{ is_expected.to validate_field_presence_of :name }

    let(:item_discount) { ItemDiscountQbxml::Add.factory(name: 'discount item name') }

    it "should create an add Discount Item xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemDiscountAddRq requestID="request_id">
              <ItemDiscountAdd>
                <Name>discount item name</Name>
              </ItemDiscountAdd>
            </ItemDiscountAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item_discount.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
