module QbwcRequests
  module Factory  

    class Instantiator

      def initialize module_name, klass
        @module_name = module_name
        @klass = klass
      end

      def factory params = {}, version = nil
        final_version = version || QbwcRequests.QBXML_VERSION
        object = Object.const_get("QbwcRequests::#{@module_name}::V#{final_version}::#{@klass}")
        object.new(params)
      end

      def name
        @module_name
      end

    end


    def const_missing(name)
      if [:Mod, :Add, :Query].include?(name)
        Instantiator.new(self.name.gsub("Qbxml",""),name)
      else
        raise "NameError: uninitialized constant #{name}"
      end
    end
  end
end
