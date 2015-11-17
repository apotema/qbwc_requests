module VendorQbxml
  class Modify

    def initialize params = {}
      VendorQbxml::(QbwcRequest.version)::Modify.new(params)
    end

  end
end
