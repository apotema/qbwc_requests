require 'spec_helper'

describe VendorQbxml do

  describe VendorQbxml::Query do
    
    context "V07" do
      it_behaves_like 'queryable'
    end

    context "V13" do
      it_behaves_like 'queryable', "13"
    end

  end

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
        expect( subject.factory(name: "a").to_xml("request_id") )
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
        expect( subject.factory({name: "a"}, "13").to_xml("request_id") )
          .to be_xml_equal_to xml
      end
    end

  end

  describe VendorQbxml::Add do
    
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
        expect( subject.factory(name: "a").to_xml("request_id") )
          .to be_xml_equal_to xml
      end

    end

    context "V13" do

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
        expect( subject.factory({name: "a"},"13").to_xml("request_id") )
          .to be_xml_equal_to xml
      end

    end

  end
end
