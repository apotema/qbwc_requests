require 'spec_helper'

RSpec.describe Qbwc::Request::V07::Account do

  # it_behaves_like 'queryable'

  it { is_expected.to validate_field_presence_of :name }

  describe "add" do

    let(:account){ Qbwc::Request::V07::Account.new(name: 'a') }

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
      expect( account.add("request_id") ).to be_xml_equal_to xml
    end

  end

end
