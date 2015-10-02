module Qbwc
  module Request
    module V07
      class VendorAddress < Qbwc::Request::Base

        field :addr1
        field :addr2
        field :addr3
        field :addr4
        field :city
        field :state
        field :postal_code

      end
    end
  end
end
