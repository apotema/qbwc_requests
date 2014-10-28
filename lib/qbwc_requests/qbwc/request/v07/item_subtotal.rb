module Qbwc 
  module Request
    module V07
      class ItemSubtotal < Base
              
        field :name
        field :is_active
        field :item_desc
        field :bar_code

        validates :name, presence: true
      end
    end
  end
end