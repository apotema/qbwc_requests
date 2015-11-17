module VendorQbxml
  class Add

    def self.factory params = {}, version = nil
      object = Object.const_get("VendorQbxml::V#{version || QbwcRequests.QBXML_VERSION}::Add")
      object.new(params)
    end

  end
end
