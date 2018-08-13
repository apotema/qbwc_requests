require 'spec_helper'

describe BillQbxml do

  describe BillQbxml::Query do
    it_behaves_like 'queryable'
  end

  describe "add" do
    let(:line_1) do
      {
        item_ref: {list_id: '01-01', full_name: 'one'},
        desc: 'line item 1',
        quantity: 50,
        unit_of_measure: 'yards',
        cost: 15.001,
        amount: 750.05,
        customer_ref: {list_id: '08-01', full_name: 'project_one'},
        billable_status: 'HasBeenBilled',
        data_ext: {owner_id: 55555, data_ext_name: 'line_one', data_ext_value: 1},
      }
    end

    let(:line_2) do
      {
        item_ref: {list_id: '01-02', full_name: 'two'},
        desc: 'line item 2',
        quantity: 25,
        unit_of_measure: 'feet',
        cost: 5.01,
        amount: 125.25,
        customer_ref: {list_id: '08-02', full_name: 'project_two'},
        billable_status: 'HasBeenBilled',
        data_ext: {owner_id: 444444, data_ext_name: 'line_two', data_ext_value: 2},
      }
    end

    let(:bill) do
      BillQbxml::Add.factory(
        vendor_ref: {list_id: 10},
        memo: 'Hello',
        txn_date: '01/02/2018',
        due_date: '01/03/2018',
        ref_number: '305',
        expense_line_add: {account_ref: {full_name: 'Some item ref full name'}},
        item_line_add: [line_1, line_2],
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
                <ItemLineAdd>
                  <ItemRef>
                    <ListID>01-01</ListID>
                    <FullName>one</FullName>
                  </ItemRef>
                  <Desc>line item 1</Desc>
                  <Quantity>50</Quantity>
                  <UnitOfMeasure>yards</UnitOfMeasure>
                  <Cost>15.001</Cost>
                  <Amount>750.05</Amount>
                  <CustomerRef>
                    <ListID>08-01</ListID>
                    <FullName>project_one</FullName>
                  </CustomerRef>
                  <BillableStatus>HasBeenBilled</BillableStatus>
                  <DataExt>
                    <OwnerID>55555</OwnerID>
                    <DataExtName>line_one</DataExtName>
                    <DataExtValue>1</DataExtValue>
                  </DataExt>
                </ItemLineAdd>
                <ItemLineAdd>
                  <ItemRef>
                    <ListID>01-02</ListID>
                    <FullName>two</FullName>
                  </ItemRef>
                  <Desc>line item 2</Desc>
                  <Quantity>25</Quantity>
                  <UnitOfMeasure>feet</UnitOfMeasure>
                  <Cost>5.01</Cost>
                  <Amount>125.25</Amount>
                  <CustomerRef>
                    <ListID>08-02</ListID>
                    <FullName>project_two</FullName>
                  </CustomerRef>
                  <BillableStatus>HasBeenBilled</BillableStatus>
                  <DataExt>
                    <OwnerID>444444</OwnerID>
                    <DataExtName>line_two</DataExtName>
                    <DataExtValue>2</DataExtValue>
                  </DataExt>
                </ItemLineAdd>
              </BillAdd>
            </BillAddRq>
          </QBXMLMsgsRq>
        </QBXML>
      XML
      expect( bill.to_xml("request_id") ).to be_xml_equal_to xml
    end

  end

end
