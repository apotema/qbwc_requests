module QbwcRequests
  module ItemNonInventory
    module V07
      class Add < QbwcRequests::Base

        field :name
        field :is_active
        field :pricetype
        ref_to :parent, 1000

        validates :name, presence: true
            
      end
    end
  end
end
