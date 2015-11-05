RSpec.shared_examples 'queryable' do
    
  let(:xml) do
    <<-XML
      <?xml version="1.0" encoding="ISO-8859-1"?>
      <?qbxml version="7.0"?>
      <QBXML>
        <QBXMLMsgsRq onError="stopOnError">
          <#{described_class.name.demodulize}QueryRq>
            <MaxReturned>2000</MaxReturned>
          </#{described_class.name.demodulize}QueryRq>
        </QBXMLMsgsRq>
      </QBXML>
    XML
  end

  it "creates a valid #{described_class.name.gsub(/^.*::/, '')}QueryRq xml" do
    expect(described_class.query).to be_xml_equal_to xml
  end

end
