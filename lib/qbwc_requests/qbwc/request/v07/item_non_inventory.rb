module Qbwc 
  module Request
    module V07
      class ItemNonInventory < Qbwc::Request::Base

        field :name
        field :is_active
        field :pricetype
        ref_to :parent, 1000

        validates :name, presence: true
      end
    end
  end
end
