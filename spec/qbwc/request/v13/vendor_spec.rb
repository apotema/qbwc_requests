require 'spec_helper'

RSpec.describe Qbwc::Request::V13::Vendor do

  # it_behaves_like 'queryable', "13.0"

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do

    let(:vendor){ Qbwc::Request::V13::Vendor.new(name: 'a') }

    it "should create an add vendor xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="13.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <VendorAddRq requestID="request_id">
              <VendorAdd>
                <Name>a</Name>
              </VendorAdd>
            </VendorAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( vendor.add("request_id") ).to be_xml_equal_to xml
    end

  end
end
