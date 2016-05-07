module QbwcRequests
  module ItemService
    module V07
      class Mod < QbwcRequests::Base

        field :list_id
        field :edit_sequence
        field :name
        field :is_active
        ref_to :parent, 31
        ref_to :unit_of_measure_set, 31
        ref_to :sales_tax_code, 3
        field :sales_or_purchase_mod
        field :sales_and_purchase_mod

      end
    end
  end
end
