require 'spec_helper'

describe Qbwc::Request::V07::ItemService do

  # it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do

    let(:item) {Qbwc::Request::V07::ItemService.new(name: 'Service item name')}

    it "should create an add Item Service xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <ItemServiceAddRq requestID="request_id">
              <ItemServiceAdd>
                <Name>Service item name</Name>
              </ItemServiceAdd>
            </ItemServiceAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.add("request_id") ).to be_xml_equal_to xml
    end

  end

end
