module QbwcRequests
  module PurchaseOrder
    module V07
      class Add < QbwcRequests::Base
        field :def_macro
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
        field :fob
        field :memo
        field :vendor_msg
        field :is_to_be_printed
        field :is_to_be_emailed
        field :other1
        field :other2
        field :purchase_order_line_add
        field :purchase_order_line_group_add

        validates :ref_number, length: { maximum: 11 }
        validates :fob, length: { maximum: 13 }
        validates :memo, length: { maximum: 4095 }
        validates :vendor_msg, length: { maximum: 99 }
        validates :other1, length: { maximum: 25 }
        validates :other2, length: { maximum: 29 }
      end
    end
  end
end
