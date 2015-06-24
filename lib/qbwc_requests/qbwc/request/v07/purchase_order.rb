module Qbwc 
  module Request
    module V07
      class PurchaseOrder < Qbwc::Request::Base

        field :vendor_ref
        field :class_ref
        field :ship_to_entity_ref
        field :template_ref
        field :txn_date
        field :ref_number
        field :vendor_address
        field :ship_address
        field :terms_ref
        field :due_date
        field :expected_date
        field :ship_method_ref
        field :FOB
        field :memo
        field :vendor_msg
        field :is_to_be_printed
        field :is_to_be_emailed
        field :is_tax_included
        field :sales_tax_code_ref
        field :other1
        field :other2
        field :purchase_order_line_add
        field :purchase_order_line_group_add
        
      end
    end
  end
end
