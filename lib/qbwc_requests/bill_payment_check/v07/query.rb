module QbwcRequests
  module BillPaymentCheck
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :modified_date_range_filter
        field :include_line_items
      end
    end
  end
end