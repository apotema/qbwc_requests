module VendorQbxml
  class Modify

    def self.factory params = {}
      object = Object.const_get("VendorQbxml::V#{QbwcRequests.QBXML_VERSION}::Modify")
      object.new(params)
    end

  end
end
