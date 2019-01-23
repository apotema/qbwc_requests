module QbwcRequests
  module BillPaymentCheck
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :from_modified_date
        field :include_line_items
      end
    end
  end
end