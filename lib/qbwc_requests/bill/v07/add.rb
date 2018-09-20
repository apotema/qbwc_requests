module QbwcRequests
  module Bill
    module V07
      class Add < QbwcRequests::Base

        ref_to :vendor, 41
        field :txn_date
        field :due_date
        field :ref_number
        field :memo
        field :link_to_txn_id
        field :expense_line_add
        field :item_line_add

        validates :memo, length: { maximum: 4095 }
        validates :ref_number, length: { maximum: 11 }
      end
    end
  end
end
