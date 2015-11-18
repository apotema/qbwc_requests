require 'spec_helper'

describe VendorQbxml::Modify do
  
  context "V07" do

    it "should create an modify vendor xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <VendorModifyRq requestID="request_id">
              <VendorModify>
                <Name>a</Name>
              </VendorModify>
            </VendorModifyRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( subject.class.factory(name: "a").to_xml("request_id") )
        .to be_xml_equal_to xml
    end

  end

  context "V13" do

    it "should create an modify vendor xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="13.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <VendorModifyRq requestID="request_id">
              <VendorModify>
                <Name>a</Name>
              </VendorModify>
            </VendorModifyRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( subject.class.factory({name: "a"}, "13").to_xml("request_id") )
        .to be_xml_equal_to xml
    end
  end

end

