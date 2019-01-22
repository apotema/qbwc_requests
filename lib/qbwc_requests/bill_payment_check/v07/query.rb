module QbwcRequests
  module BillPaymentCheck
    module V07
      class Query < QbwcRequests::Base
        field :from_modified_date
        field :include_line_items
      end
    end
  end
end