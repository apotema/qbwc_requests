module Qbwc 
  module Request
    module V07
      class Invoice < Base

        field :customer_ref
        field :invoice_line_add

        validates :customer_ref, presence: true
        validates :invoice_line_add, presence: true
        
      end
    end
  end
end