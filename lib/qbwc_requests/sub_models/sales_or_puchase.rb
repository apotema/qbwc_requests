module QbwcRequests
  module SubModels
    class SalesOrPurchase < QbwcRequests::Base
      field  :desc
      field  :price
      field  :price_percent
      ref_to :account, 159

      validates :desc, length: { maximum: 4095 }
    end
  end
end
