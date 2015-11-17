module VendorQbxml
  class Add

    def self.fabricate params = {}
      object = Object.const_get("VendorQbxml::V#{QbwcRequests.QBXML_VERSION}::Add")
      object.new(params)
    end

  end
end
