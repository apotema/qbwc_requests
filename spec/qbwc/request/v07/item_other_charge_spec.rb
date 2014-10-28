require 'spec_helper'

describe Qbwc::Request::V07::ItemOtherCharge do
  
  it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :name }
  it{ is_expected.to validate_field_presence_of :sales_or_purchase }

  describe "add" do

    let(:item){ Qbwc::Request::V07::ItemOtherCharge.new(name: 'OtherCharge item name', sales_or_purchase: {price: "10.00", account_ref: {full_name: 'Some Account Name'}} ) }

    it "should create an add Item Other Charge xml" do
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version=\"7.0\"?>
        <QBXML>
          <QBXMLMsgsRq onError=\"stopOnError\">
            <ItemOtherChargeAddRq requestID=\"2\">
              <ItemOtherChargeAdd>
                <Name>OtherCharge item name</Name>
                <SalesOrPurchase>
                  <Price>10.00</Price>
                  <AccountRef>
                    <FullName>Some Account Name</FullName>
                  </AccountRef>
                </SalesOrPurchase>
              </ItemOtherChargeAdd>
            </ItemOtherChargeAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item.add ).to be_xml_equal_to xml
    end

  end

end