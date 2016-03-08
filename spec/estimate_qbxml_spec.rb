require 'spec_helper'

RSpec.describe EstimateQbxml do

  describe EstimateQbxml::Query do

    it_behaves_like 'queryable'

  end

  describe EstimateQbxml::Add do

    it{ is_expected.to validate_field_presence_of :customer_ref }

    let(:estimate) do
      EstimateQbxml::Add.factory(
        customer_ref: {full_name: 'Some customer name'},
        estimate_line_add: [
          {item_ref: {full_name: 'item1'}},
          {item_ref: {full_name: 'item2'}}]
      )
    end

    it "should create an add estimate xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <EstimateAddRq requestID="request_id">
              <EstimateAdd>
                <CustomerRef>
                  <FullName>Some customer name</FullName>
                </CustomerRef>
                <EstimateLineAdd>
                  <ItemRef>
                    <FullName>item1</FullName>
                  </ItemRef>
                </EstimateLineAdd>
                <EstimateLineAdd>
                  <ItemRef>
                    <FullName>item2</FullName>
                  </ItemRef>
                </EstimateLineAdd>
              </EstimateAdd>
            </EstimateAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( estimate.to_xml("request_id") ).to be_xml_equal_to xml
    end
  end

  describe EstimateQbxml::Mod do

    it{ is_expected.to validate_field_presence_of :txn_id }
    it{ is_expected.to validate_field_presence_of :edit_sequence }

    let(:estimate) do
      EstimateQbxml::Mod.factory(
        txn_id: 'transaction id',
        edit_sequence: 'edit sequence',
        estimate_line_mod: [
          {txn_line_id: 'line id 1'},
          {txn_line_id: 'line id 2'}]
      )
    end

    it "should create an add estimate xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <EstimateModRq requestID="request_id">
              <EstimateMod>
                <TxnID>transaction id</TxnID>
                <EditSequence>edit sequence</EditSequence>
                <EstimateLineMod>
                  <TxnLineID>line id 1</TxnLineID>
                </EstimateLineMod>
                <EstimateLineMod>
                  <TxnLineID>line id 2</TxnLineID>
                </EstimateLineMod>
              </EstimateMod>
            </EstimateModRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( estimate.to_xml("request_id") ).to be_xml_equal_to xml
    end
  end

end
