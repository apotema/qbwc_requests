module QbwcRequests
  module ItemService
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :active_status
        field :from_modified_date
      end
    end
  end
end
