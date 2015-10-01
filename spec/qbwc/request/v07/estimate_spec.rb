require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Estimate do

  it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :customer_ref }
  it{ is_expected.to validate_field_presence_of :estimate_line_add }

  describe "add" do

    let(:estimate){ Qbwc::Request::V07::Estimate.new(customer_ref: {full_name: 'Some customer name'}, estimate_line_add: {item_ref: {full_name: 'Some intem name'}}) }

    it "should create an add estimate xml" do
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
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
                    <FullName>Some intem name</FullName>
                  </ItemRef>
                </EstimateLineAdd>
              </EstimateAdd>
            </EstimateAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( estimate.add("request_id") ).to be_xml_equal_to xml
    end

  end
end
