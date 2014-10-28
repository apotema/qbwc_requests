require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Customer do
  
  it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do

    let(:customer){ Qbwc::Request::V07::Customer.new(name: 'a') }

    it "should create an add customer xml" do
      xml = <<-XML
        <?xml version='1.0' encoding='utf-8'?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <CustomerAddRq requestID="2">
              <CustomerAdd>
                <Name>a</Name>
              </CustomerAdd>
            </CustomerAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( customer.add ).to be_xml_equal_to xml
    end

  end

end