module QbwcRequests
  module PurchaseOrder
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :txn_id
        field :include_line_items
      end
    end
  end
end
