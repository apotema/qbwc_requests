require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Bill do
  
  it_behaves_like 'queryable'

  describe "add" do

    let(:bill){ Qbwc::Request::V07::Bill.new() }

    it "should create an add bill xml" do
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <BillAddRq requestID="2">
              <BillAdd>
              </BillAdd>
            </BillAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( bill.add ).to be_xml_equal_to xml
    end

  end

end
