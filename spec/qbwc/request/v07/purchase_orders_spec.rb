require 'spec_helper'

RSpec.describe Qbwc::Request::V07::PurchaseOrder do
  
  it_behaves_like 'queryable'

  describe "add" do
    
    let(:purchase_order){ Qbwc::Request::V07::PurchaseOrder.new(vendor_ref: {full_name: "Vendor full name"}, purchase_order_line_add: {item_ref: {full_name: 'Some item ref full name'}}) }

    it "should create an add purchase order xml" do  
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <PurchaseOrderAddRq requestID="2">
              <PurchaseOrderAdd>
                <VendorRef>
                  <FullName>Vendor full name</FullName>
                </VendorRef>
                <PurchaseOrderLineAdd>
                  <ItemRef>
                    <FullName>Some item ref full name</FullName>
                  </ItemRef>
                </PurchaseOrderLineAdd>
              </PurchaseOrderAdd>
            </PurchaseOrderAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( purchase_order.add ).to be_xml_equal_to xml
    end
    
  end
end