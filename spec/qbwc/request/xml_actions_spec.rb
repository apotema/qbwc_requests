require 'spec_helper'

class GenericBase < Qbwc::Request::Base
end

describe Qbwc::XmlActions do

  describe '#query' do

    it 'should generate a xml with just the filled fields' do
      query_xml = GenericBase.query(nil, {"requestID" => "request_id" })
      expected_xml = <<-XML
      <?xml version="1.0" encoding="ISO-8859-1"?>
      <?qbxml version="7.0"?>
      <QBXML>
        <QBXMLMsgsRq onError="stopOnError">
          <GenericBaseQueryRq requestID="request_id">
            <MaxReturned>2000</MaxReturned>
          </GenericBaseQueryRq>
        </QBXMLMsgsRq>
      </QBXML>
      XML
      expect( query_xml ).to be_xml_equal_to expected_xml
    end

  end

end
