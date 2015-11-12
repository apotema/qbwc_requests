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

* Query Requisitions

  ```ruby
    Qbwc::Request::V07::Account.query
  ```

  result

  ```xml
    <?xml version='1.0' encoding='utf-8'?>
    <?qbxml version="7.0"?>
    <QBXML>
      <QBXMLMsgsRq onError="stopOnError">
        <AccountQueryRq>
          <MaxReturned>2000</MaxReturned>
        </AccountQueryRq>
      </QBXMLMsgsRq>
    </QBXML>
  ```

That will create an Account query for the qbxml version 7.0

* Add Requisitions

  ```ruby
    Qbwc::Request::V07::Account.new(name: 'Some Account name').add("2")
  ```

  result  

  ```xml
  <?xml version='1.0' encoding='utf-8'?>
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

  You can also call <tt>valid?</tt> on the object to see the required fields.

* Delete Requisitions

    Not Implemented

* Update Requisitions

    Not Implemented


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
