module QbwcRequests
  module SubModels
    class EstimateLineGroupAdd < QbwcRequests::Base
      ref_to  :item_group, 31
      field   :quantity
      field   :unit_of_measure
      field   :data_ext_list

      validates :unit_of_measure, length: { maximum: 31 }
    end
  end
end
