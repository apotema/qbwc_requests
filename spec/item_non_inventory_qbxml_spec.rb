require 'spec_helper'

describe ItemNonInventoryQbxml do

  describe ItemNonInventoryQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe ItemNonInventoryQbxml::Add do

    it{ is_expected.to validate_field_presence_of :name }

    it "should create an add Item Non Invetory xml" do
      item = ItemNonInventoryQbxml::Add.factory(name: 'NonInventory item name')
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemNonInventoryAddRq requestID="request_id">
              <ItemNonInventoryAdd>
                <Name>NonInventory item name</Name>
              </ItemNonInventoryAdd>
            </ItemNonInventoryAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
