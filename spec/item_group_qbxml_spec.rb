require 'spec_helper'

describe ItemGroupQbxml do

  describe ItemGroupQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe ItemGroupQbxml::Add do

    it{ is_expected.to validate_field_presence_of :name }

    it "should create an add Item Group xml" do
      item = ItemGroupQbxml::Add.factory(name: 'Group item name')
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemGroupAddRq requestID="request_id">
              <ItemGroupAdd>
                <Name>Group item name</Name>
              </ItemGroupAdd>
            </ItemGroupAddRq>
          </QBXMLMsgsRq>
        </QBXML>
       XML
      expect( item.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
