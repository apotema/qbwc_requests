module QbwcRequests
  module Invoice
    module V07
      class Add < QbwcRequests::Base

        ref_to :customer, 209
        field :invoice_line_add

        validates :customer_ref, presence: true
        validates :invoice_line_add, presence: true
            
      end
    end
  end
end
