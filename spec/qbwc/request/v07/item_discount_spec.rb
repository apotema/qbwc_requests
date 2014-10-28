require 'spec_helper'

describe Qbwc::Request::V07::ItemDiscount do
  
  it_behaves_like 'queryable'

  it{ is_expected.to validate_field_presence_of :name }

  describe "add" do

    let(:item_discount) { Qbwc::Request::V07::ItemDiscount.new(name: 'discount item name') }

    it "should create an add Discount Item xml" do
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version=\"7.0\"?>
        <QBXML>
          <QBXMLMsgsRq onError=\"stopOnError\">
            <ItemDiscountAddRq requestID=\"2\">
              <ItemDiscountAdd>
                <Name>discount item name</Name>
              </ItemDiscountAdd>
            </ItemDiscountAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( item_discount.add ).to be_xml_equal_to xml
    end

  end

end