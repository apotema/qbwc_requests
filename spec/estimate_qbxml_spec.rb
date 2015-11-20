require 'spec_helper'

RSpec.describe EstimateQbxml do

  describe EstimateQbxml::Query do

    it_behaves_like 'queryable'

  end

  describe EstimateQbxml::Add do

    it{ is_expected.to validate_field_presence_of :customer_ref }
    it{ is_expected.to validate_field_presence_of :estimate_line_add }

    let(:estimate){ 
      EstimateQbxml::Add.factory(
        customer_ref: {full_name: 'Some customer name'},
        estimate_line_add: {
          item_ref: {full_name: 'Some intem name'}
        }
      )
    }

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
                    <FullName>Some intem name</FullName>
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
end
