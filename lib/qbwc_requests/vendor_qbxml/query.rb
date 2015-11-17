module VendorQbxml
  class Query

    def initialize params = {}
      object = Object.const_get("VendorQbxml::V#{QbwcRequests.QBXML_VERSION}::Query")
      object.new(params)
    end

  end
end
