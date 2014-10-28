require 'spec_helper'

describe Qbwc::Request::V07::ItemNonInventory do
  
  it_behaves_like 'queryable'
  
  it{ is_expected.to validate_field_presence_of :name }

  describe "add" do

    it "should create an add Item Non Invetory xml" do
      item = Qbwc::Request::V07::ItemNonInventory.new(name: 'NonInventory item name')
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemNonInventoryAddRq requestID="2">
              <ItemNonInventoryAdd>
                <Name>NonInventory item name</Name>
              </ItemNonInventoryAdd>
            </ItemNonInventoryAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.add ).to be_xml_equal_to xml
    end

  end

end