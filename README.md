# QbwcRequests

With QbwcRequest you have a easy way to create Qbxml requests.

## Installation

Add this line to your application's Gemfile:

    gem 'qbwc_requests'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qbwc_requests

## Usage

* Query Requisitions

      Qbwc::Request::V07::Account.query

  That will create an Account query for the qbxml version 7.

* Add Requisitions

    Qbwc::Request::V07::Account.new(name: 'Some Account name').add
  
  That will create an account xml add requisition.
  Note that name is mandatory in order to create an Account.
  If no name is provided, the result will be a hash of errors.

  You can also call valid? on the object to see the required fields.

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

The Qbxml version for this models is the 7.0.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request