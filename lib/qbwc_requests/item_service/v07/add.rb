module QbwcRequests
  module ItemService
    module V07
      class Add < QbwcRequests::Base

        field :name
        field :is_active
        field :price
        field :sales_or_purchase

        validates :name, presence: true
            
      end
    end
  end
end
