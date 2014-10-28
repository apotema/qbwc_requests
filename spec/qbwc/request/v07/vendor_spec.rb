require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Vendor do

  it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }
  
  describe "add" do

    let(:vendor){ Qbwc::Request::V07::Vendor.new(name: 'a') }

    it "should create an add vendor xml" do  
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <VendorAddRq requestID="2">
              <VendorAdd>
                <Name>a</Name>
              </VendorAdd>
            </VendorAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( vendor.add ).to be_xml_equal_to xml
    end

  end
end