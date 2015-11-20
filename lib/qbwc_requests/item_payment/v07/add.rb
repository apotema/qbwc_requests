module QbwcRequests
  module ItemPayment
    module V07
      class Add < QbwcRequests::Base

        field :name
        field :is_active
        field :item_desc

        validates :name, presence: true
            
      end
    end
  end
end
