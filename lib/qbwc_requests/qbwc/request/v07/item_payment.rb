module Qbwc 
  module Request
    module V07
      class ItemPayment < Qbwc::Request::Base

        field :name
        field :is_active
        field :item_desc

        validates :name, presence: true
      end
    end
  end
end
