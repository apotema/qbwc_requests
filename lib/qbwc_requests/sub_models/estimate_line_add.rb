module QbwcRequests
  module SubModels
    class EstimateLineAdd < QbwcRequests::Base
      ref_to  :item
      field   :desc
      field   :quantity
      field   :unit_of_measure
      field   :rate
      field   :rate_percent
      ref_to  :class, 159
      field   :amount
      ref_to  :sales_tax_code, 3
      field   :markup_rate
      field   :markup_rate_percent
      ref_to  :price_level, 31
      ref_to  :override_item_account_ref, 159
      field   :other1
      field   :other2
      field   :data_ext_list

      validates :item, presence: true
      validates :desc, length: { maximum: 4095 }
      validates :unit_of_measure, length: { maximum: 31 }
      validates :other1, length: { maximum: 29 }
      validates :other2, length: { maximum: 29 }
    end
  end
end
