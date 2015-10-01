module Qbwc
  module Request
    class Base

      include Qbwc::OrderedFields
      extend ActiveModel::Naming
      include ActiveModel::Validations
      include ActiveModel::Conversion

      def self.query options = nil, header = nil
        options = { max_returned: 2000 } if options == nil or options.empty?
        XmlActions.query "#{underscore self.name.demodulize}_query_rq", options, header
      end

      def modify
        modify_xml
      end

      def add
        self.valid? ? add_xml : self
      end

      def initialize(attributes = {})
        @attributes = compact(attributes)
        @attributes.each do |name, value|
          self.instance_variable_set("@#{name}", value) if value.present?
        end
      end

      def class_name
        self.class.underscore self.class.name.demodulize
      end

      def persisted?
        false
      end

      private

        def self.underscore string
          string.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
        end

        def compact opts={}
          # I pass two times to avoid {v: '1',k: {}}, gotta find a better algorithm (recursive)
          return {} if opts.nil?
          proc = Proc.new { |k, v| v.kind_of?(Hash) ? (v.delete_if(&proc); nil) : (v == nil || v.empty?) };
          hash = opts.delete_if(&proc)
          hash.delete_if { |k, v| (v == nil || v.empty?) }
        end

        def add_xml
          req = XmlActions.header
          req['qbxml']['qbxml_msgs_rq']["#{class_name}_add_rq"] = {"xml_attributes"=>
              {"requestID"=>"2"},
                "#{class_name}_add"=> self.ordered_fields
              }
          XmlActions.to_xml(req)
        end


        def modify_xml
          req = XmlActions.header
          req['qbxml']['qbxml_msgs_rq']["#{class_name}_mod_rq"] = {"xml_attributes"=>
              {"requestID"=>"2"},
                "#{class_name}_mod"=> self.ordered_fields
              }
          XmlActions.to_xml(req)
        end

    end
  end
end
