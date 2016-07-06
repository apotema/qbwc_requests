module QbwcRequests
  module Bill
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :entity_filter
        field :include_line_items
      end
    end
  end
end
