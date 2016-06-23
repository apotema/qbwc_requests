module QbwcRequests
  module Invoice
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :entity_filter
      end
    end
  end
end
