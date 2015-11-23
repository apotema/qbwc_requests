module QbwcRequests
  module PurchaseOrder
    module V07
      class Mod < QbwcRequests::Base
        ref_to :vendor, 41
        ref_to :class, 159
        ref_to :ship_to_entity, 209
        ref_to :template, 31
        field :txn_date
        field :ref_number
        field :vendor_address
        field :ship_address
        ref_to :terms, 31
        field :due_date
        field :expected_date
        ref_to :ship_method, 15
        field :FOB
        field :memo
        field :vendor_msg
        field :is_to_be_printed
        field :is_to_be_emailed
        field :is_tax_included
        ref_to :sales_tax_code, 3 
        field :other1
        field :other2
        field :purchase_order_line_add
        field :purchase_order_line_group_add
        field :purchase_order_line_mod
        field :txn_ID
        field :edit_sequence
      end
    end
  end
end
