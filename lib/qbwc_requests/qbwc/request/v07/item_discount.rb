module Qbwc 
  module Request
    module V07
      class ItemDiscount < Base

        field :name
        field :is_active
        field :account_ref
        field :discount_rate

        validates :name, presence: true
      end
    end
  end
end