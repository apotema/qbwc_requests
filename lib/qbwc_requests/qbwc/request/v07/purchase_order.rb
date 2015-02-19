module Qbwc 
  module Request
    module V07
      class PurchaseOrder < Qbwc::Request::Base

        field :vendor_ref
        field :purchase_order_line_add
        
      end
    end
  end
end
