module VendorQbxml

  class Base
    def self.factory params = {}, version = nil
      class_module = self.name.split(':').first
      final_version = version || QbwcRequests.QBXML_VERSION
      class_name = self.name.split(':').last
      object = Object.const_get(
        "#{class_module}::V#{final_version}::#{class_name}"
      )
      object.new(params)
    end
  end

  class Add < Base; end

  class Modify < Base; end

  class Query < Base; end

  def self.const_missing(name)
    if [:Modify, :Add, :Query].include?(name)
      Object.const_get(name)
    else
      raise "NameError: uninitialized constant #{name}"
    end
  end

end
