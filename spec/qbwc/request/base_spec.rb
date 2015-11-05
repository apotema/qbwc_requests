require 'spec_helper'

class GenericBase < Qbwc::Request::Base
  field :vendor_ref
  field :ref_number
  field :memo
  field :purchase_order_line_add
end

describe GenericBase do

  describe '#initialize' do

    it 'should deal with nil values' do
      expect {
        GenericBase.new(nil)
      }.to_not raise_error
    end

  end


  describe '#add' do

    let(:parameters) {
      {
        :vendor_ref => {
          :list_ID => nil
        },
        :ref_number => nil,
        :memo => nil,
        :purchase_order_line_add => []
      }
    }

    it 'should not raise error for nil values' do
      expect {
        GenericBase.new(parameters).add("request_id")
      }.to_not raise_error
    end

    it 'should generate a xml with just the filled fields' do

      expected_xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <GenericBaseAddRq requestID="request_id">
              <GenericBaseAdd></GenericBaseAdd>
            </GenericBaseAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      add_xml = GenericBase.new(parameters).add("request_id")
      expect( add_xml ).to be_xml_equal_to expected_xml
    end

  end

end
