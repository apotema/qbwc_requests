module QbwcRequests
  module Account
    module V07
      class Add < QbwcRequests::Base

        field :name

        validates :name, presence: true
        
      end
    end
  end
end
