module QbwcRequests
  module BillPaymentCreditCard
    module V07
      class Query < QbwcRequests::Base
      	field :txn_id
        field :max_returned
        field :modified_date_range_filter
        field :include_line_items
      end
    end
  end
end