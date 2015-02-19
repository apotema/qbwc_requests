module Qbwc 
  module Request
    module V07
      class ItemService < Qbwc::Request::Base

        field :name
        field :is_active
        field :price
        field :sales_or_purchase

        validates :name, presence: true
      end
    end
  end
end
