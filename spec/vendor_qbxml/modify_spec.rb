require 'spec_helper'

describe VendorQbxml::Modify do
  
  context "V07" do

    it "should create an add vendor xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
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
      expect( subject.class.factory(name: "a").to_xml("request_id") )
        .to be_xml_equal_to xml
    end

  end

  context "V13" do

  end

end

