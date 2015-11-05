RSpec.shared_examples 'queryable' do
  
  describe 'query method' do
    
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

    it 'should create a query xml' do
      expect(described_class.query).to be_xml_equal_to xml
    end

  end

end
