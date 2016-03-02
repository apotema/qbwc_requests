module QbwcRequests
  module ItemService
    module V07
      class Add < QbwcRequests::Base

        field :name
        field :is_active
        ref_to :parent, 31
        ref_to :unit_of_measure_set, 31
        ref_to :sales_tax_code, 3
        field :sales_or_purchase
        field :sales_and_purchase

        validates :name, presence: true
      end
    end
  end
end
