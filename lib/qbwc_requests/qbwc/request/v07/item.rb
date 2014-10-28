module Qbwc 
  module Request
    module V07
      class Item
        def self.query_all
          XmlActions.query "item_query_rq", 2000
        end
      end
    end
  end
end