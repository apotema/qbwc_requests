RSpec.shared_examples 'queryable' do |version| 
    
  let(:xml) do
    name = described_class.name
    <<-XML
      <?xml version="1.0" encoding="ISO-8859-1"?>
      <?qbxml version="#{version ? version+'.0' : '7.0'}"?>
      <QBXML>
        <QBXMLMsgsRq onError="stopOnError">
          <#{name}QueryRq requestID="request_id">
            <MaxReturned>2000</MaxReturned>
          </#{name}QueryRq>
        </QBXMLMsgsRq>
      </QBXML>
    XML
  end

  it "creates a valid #{described_class.name}QueryRq xml" do    
    expect(described_class.factory({max_returned: 2000},version||"07").to_xml("request_id")).to be_xml_equal_to xml
  end

end
