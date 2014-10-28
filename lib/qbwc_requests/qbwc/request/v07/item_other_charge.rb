module Qbwc 
  module Request
    module V07
      class ItemOtherCharge < Base

        field :name
        field :is_active
        field :pricetype
        field :sales_or_purchase

        validates :sales_or_purchase, presence: true
        validates :name, presence: true, length: { maximum: 41 }
      end
    end
  end
end