module QbwcRequests
  module ItemSubtotal
    module V07
      class Add < QbwcRequests::Base

        field :name
        field :is_active
        field :item_desc
        field :bar_code

        validates :name, presence: true
            
      end
    end
  end
end
