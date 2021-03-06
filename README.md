# Qbwc Requests

With qbwc_requests you have an easy way to create Qbxml requests.

[![Build Status](https://semaphoreci.com/api/v1/projects/c357ba42-3d3e-4061-985e-6c3c9c68a9b4/557601/badge.svg)](https://semaphoreci.com/apotema/qbwc_requests)
[![Code Climate](https://codeclimate.com/github/apotema/qbwc_requests/badges/gpa.svg)](https://codeclimate.com/github/apotema/qbwc_requests)
[![Test Coverage](https://codeclimate.com/github/apotema/qbwc_requests/badges/coverage.svg)](https://codeclimate.com/github/apotema/qbwc_requests/coverage)

## Installation

Add this line to your application's Gemfile:

    gem 'qbwc_requests'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qbwc_requests

## Usage

### Query

  ```ruby
  AccountQbxml::Query.factory({max_returned: 2000}).to_xml("request_id")
  ```

  result

  ```xml
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <?qbxml version="7.0"?>
    <QBXML>
      <QBXMLMsgsRq onError="stopOnError">
        <AccountQueryRq requestID="request_id">
          <MaxReturned>2000</MaxReturned>
        </AccountQueryRq>
      </QBXMLMsgsRq>
    </QBXML>
  ```

That will create an Account query for the qbxml version 7.0

### Add

  ```ruby
  AccountQbxml::Add.factory(name: 'Some Account name').to_xml("2")
  ```

  Result  

  ```xml
  <?xml version="1.0" encoding="ISO-8859-1"?>
  <?qbxml version="7.0"?>
  <QBXML>
    <QBXMLMsgsRq onError="stopOnError">
      <AccountAddRq requestID="2">
        <AccountAdd>
          <Name>Some Account name</Name>
        </AccountAdd>
      </AccountAddRq>
    </QBXMLMsgsRq>
  </QBXML>
  ```

  That will create an account xml add requisition.
  Note that <tt>name</tt> is mandatory in order to create an Account.
  If no name is provided, the result will be a hash of errors.

  You can also call <tt>valid?</tt> on the object to check if the object is valid.

### Delete

    Not Implemented

### Update

  ```ruby
  VendorQbxml::Mod.factory({name: "Vendor Name"}).to_xml("request_id")
  ```

  ```xml
  <?xml version="1.0" encoding="ISO-8859-1"?>
  <?qbxml version="7.0"?>
  <QBXML>
    <QBXMLMsgsRq onError="stopOnError">
      <VendorModRq requestID="request_id">
        <VendorMod>
          <Name>Vendor Name</Name>
        </VendorMod>
      </VendorModRq>
    </QBXMLMsgsRq>
  </QBXML>
  ```

### Change Version

  You can use diferent versions of versions of the QBXML in two ways.

  - Extra Parameter
  ```ruby
  VendorQbxml::Mod.factory({name: "Vendor Name"}, "13").to_xml("request_id")
  ```

  - General Configuration
  ```ruby
  QbwcRequests.QBXML_VERSION = "13"
  VendorQbxml::Mod.factory({name: "Vendor Name"}).to_xml("request_id")
  ```

Right now we just have the following models on this gem.

- Customers
- Jobs
- Account
- Items
  - Discount Item
  - Non Inventory Item
  - Other Charge Item
  - Payment Item
  - Service Item
  - Subtotal Item
  - Group Item
- Vendors
- Purchase Orders
- Invoices
- Estimates

The Qbxml version for this models is the 7.0


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
