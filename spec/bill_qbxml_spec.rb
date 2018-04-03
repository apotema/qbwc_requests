require 'spec_helper'

describe BillQbxml do

  describe BillQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe "add" do

    let(:bill) do
      BillQbxml::Add.factory(
        vendor_ref: {list_id: 10},
        memo: 'Hello',
        txn_date: '01/02/2018',
        due_date: '01/03/2018',
        ref_number: '305',
        expense_line_add: {account_ref: {full_name: 'Some item ref full name'}}
      )
    end

    it "should create an add bill xml" do
      xml = <<-XML
        <?xml version="1.0" encoding="ISO-8859-1"?>
        <?qbxml version="7.0"?>
        <QBXML>
          <QBXMLMsgsRq onError="stopOnError">
            <BillAddRq requestID="request_id">
              <BillAdd>
                <VendorRef>
                  <ListID>10</ListID>
                </VendorRef>
                <Memo>Hello</Memo>
                <TxnDate>01/02/2018</TxnDate>
                <RefNumber>305</RefNumber>
                <DueDate>01/03/2018</DueDate>
                <ExpenseLineAdd>
                  <AccountRef>
                    <FullName>Some item ref full name</FullName>
                  </AccountRef>
                </ExpenseLineAdd>
              </BillAdd>
            </BillAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( bill.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
