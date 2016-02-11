require 'spec_helper'

describe JobReportQbxml do

  describe JobReportQbxml::Query do
    it "generates a JobReportQueryXML" do
      expect(JobReportQbxml::Query.factory().to_xml("request_id"))
        .to be_xml_equal_to(
          <<-XML
          <?xml version="1.0" encoding="ISO-8859-1"?><?qbxml version="7.0"?>
          <QBXML>
            <QBXMLMsgsRq onError="stopOnError">
              <JobReportQueryRq requestID="request_id"></JobReportQueryRq>
            </QBXMLMsgsRq>
          </QBXML>
          XML
        )
    end
  end
    
end
