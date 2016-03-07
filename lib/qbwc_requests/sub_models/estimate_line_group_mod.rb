module QbwcRequests
  module SubModels
    class EstimateLineGroupMod < QbwcRequests::Base
      field   :txn_line_id
      ref_to  :item_group, 31
      field   :quantity
      field   :unit_of_measure
      ref_to  :override_uom_set_ref, 31
      field   :estimate_line_mod

      validates :unit_of_measure, length: { maximum: 31 }
    end
  end
end
