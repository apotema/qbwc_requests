require 'spec_helper'

describe ItemNonInventoryQbxml do

  # it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :name }

  describe "add" do

    it "should create an add Item Non Invetory xml" do
      item = ItemNonInventoryQbxml.factory(name: 'NonInventory item name')
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
      expect( item.add("request_id") ).to be_xml_equal_to xml
    end

  end

end
