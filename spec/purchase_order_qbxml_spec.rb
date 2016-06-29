require 'spec_helper'

RSpec.describe PurchaseOrderQbxml do

  describe PurchaseOrderQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe PurchaseOrderQbxml::Add do

    let(:purchase_order){ PurchaseOrderQbxml::Add.factory(vendor_ref: {full_name: "Vendor full name"}, purchase_order_line_add: {item_ref: {full_name: 'Some item ref full name'}}) }

    it "should create an add purchase order xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <PurchaseOrderAddRq requestID="request_id">
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
      expect( purchase_order.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

  describe "update" do

    let(:purchase_order){ PurchaseOrderQbxml::Mod.factory(txn_id: 'txn_id', edit_sequence: 'edit_sequence', vendor_ref: {full_name: "Vendor full name"}, purchase_order_line_mod: {item_ref: {full_name: 'Some item ref full name'}}) }

    it "should create an add purchase order xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <PurchaseOrderModRq requestID="request_id">
              <PurchaseOrderMod>
                <TxnID>txn_id</TxnID>
                <EditSequence>edit_sequence</EditSequence>
                <VendorRef>
                  <FullName>Vendor full name</FullName>
                </VendorRef>
                <PurchaseOrderLineMod>
                  <ItemRef>
                    <FullName>Some item ref full name</FullName>
                  </ItemRef>
                </PurchaseOrderLineMod>
              </PurchaseOrderMod>
            </PurchaseOrderModRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( purchase_order.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
