module VendorQbxml
  class Query

    def initialize params = {}
      VendorQbxml::(QbwcRequest.version)::Query.new(params)
    end

  end
end
