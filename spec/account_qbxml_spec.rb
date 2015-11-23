require 'spec_helper'

describe AccountQbxml do

  describe AccountQbxml::Query do

    context "V07" do
      it_behaves_like 'queryable'
    end

  end

  describe AccountQbxml::Add do

    context "V07" do

      it { is_expected.to validate_field_presence_of :name }

      let(:account){ AccountQbxml::Add.factory(name: 'a') }

      it "should create an add account xml" do
        xml = <<-XML
          <?xml version="1.0" encoding="ISO-8859-1"?>
          <?qbxml version="7.0"?>
          <QBXML>
            <QBXMLMsgsRq onError="stopOnError">
              <AccountAddRq requestID="request_id">
                <AccountAdd>
                  <Name>a</Name>
                </AccountAdd>
              </AccountAddRq>
            </QBXMLMsgsRq>
          </QBXML>
        XML
        expect( account.to_xml("request_id") ).to be_xml_equal_to xml
      end

    end

  end

end
