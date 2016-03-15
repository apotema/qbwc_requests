module QbwcRequests
  module SubModels
    class SalesAndPurchase < QbwcRequests::Base
      field  :sales_desc
      field  :sales_price
      ref_to :income_account, 159
      field  :purchase_desc
      field  :purchase_cost
      ref_to :expense_account, 159
      ref_to :pref_vendor, 41

      validates :sales_desc, length: { maximum: 4095 }
      validates :purchase_desc, length: { maximum: 4095 }
    end
  end
end
