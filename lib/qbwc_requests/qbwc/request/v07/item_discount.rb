module Qbwc 
  module Request
    module V07
      class ItemDiscount < Qbwc::Request::Base

        field :name
        field :is_active
        field :account_ref
        field :discount_rate

        validates :name, presence: true
      end
    end
  end
end
