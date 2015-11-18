require 'spec_helper'

describe Qbwc::Request::V07::ItemGroup do

  # it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :name }

  describe "add" do

    it "should create an add Item Group xml" do
      item = Qbwc::Request::V07::ItemGroup.new(name: 'Group item name')
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
      expect( item.add("request_id") ).to be_xml_equal_to xml
    end

  end

end
