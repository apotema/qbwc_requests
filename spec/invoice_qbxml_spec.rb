require 'spec_helper'

RSpec.describe InvoiceQbxml do

  describe InvoiceQbxml::Query do
    it_behaves_like 'queryable'
  end
  
  describe InvoiceQbxml::Add do

    it{ is_expected.to validate_field_presence_of :customer_ref }
    it{ is_expected.to validate_field_presence_of :invoice_line_add }

    let(:invoice){ InvoiceQbxml::Add.factory(customer_ref: {full_name: 'Some customer name'}, invoice_line_add: {item_ref: {full_name: 'Some item name'}}) }

    it "should create an add invoice xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <InvoiceAddRq requestID="request_id">
              <InvoiceAdd>
                <CustomerRef>
                  <FullName>Some customer name</FullName>
                </CustomerRef>
                <InvoiceLineAdd>
                  <ItemRef>
                    <FullName>Some item name</FullName>
                  </ItemRef>
                </InvoiceLineAdd>
              </InvoiceAdd>
            </InvoiceAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( invoice.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end
end
