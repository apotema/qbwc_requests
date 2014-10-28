require 'spec_helper'

describe Qbwc::Request::V07::ItemGroup do
  
  it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :name }

  describe "add" do

    it "should create an add Item Group xml" do
      item = Qbwc::Request::V07::ItemGroup.new(name: 'Group item name')
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemGroupAddRq requestID="2">
              <ItemGroupAdd>
                <Name>Group item name</Name>
              </ItemGroupAdd>
            </ItemGroupAddRq>
          </QBXMLMsgsRq>
        </QBXML>
       XML
      expect( item.add ).to be_xml_equal_to xml
    end

  end

end