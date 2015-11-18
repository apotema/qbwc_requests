require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Bill do

  # it_behaves_like 'queryable'

  describe "add" do

    let(:bill){ Qbwc::Request::V07::Bill.new(vendor_ref: {list_id: 10}) }

    it "should create an add bill xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <BillAddRq requestID="request_id">
              <BillAdd>
                <VendorRef>
                  <ListID>10</ListID>
                </VendorRef>
              </BillAdd>
            </BillAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( bill.add("request_id") ).to be_xml_equal_to xml
    end

  end

end
