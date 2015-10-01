module Qbwc
  module Request
    module V07
      class Item
        def self.query
          XmlActions.query "item_query_rq", {max_returned: 2000}, {}
        end
      end
    end
  end
end
