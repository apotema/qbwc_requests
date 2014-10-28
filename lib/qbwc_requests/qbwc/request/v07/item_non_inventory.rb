module Qbwc 
  module Request
    module V07
      class ItemNonInventory < Base

        field :name
        field :is_active
        field :pricetype
        field :parent_ref

        validates :name, presence: true
      end
    end
  end
end