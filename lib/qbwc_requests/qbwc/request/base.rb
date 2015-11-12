module Qbwc
  module Request
    class Base

      include Qbwc::OrderedFields

      def self.query options = nil, header = nil
        options = { max_returned: 2000 } if options == nil or options.empty?
        hash = XmlActions.query "#{underscore self.name.demodulize}_query_rq", options, header
        self.qbxml(hash)
      end

      def modify request_id
        modify_xml request_id
      end

      def add request_id
        self.valid? ? add_xml(request_id) : self
      end

      def initialize(attributes = {})
        @attributes = compact(attributes)
        @attributes.each do |name, value|
          self.instance_variable_set("@#{name}", value) if value.present?
        end
      end

      def self.qbxml hash
        Qbxml.new.to_qbxml(hash)
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
          proc = Proc.new { |k, v| v.kind_of?(Hash) ? (v.delete_if(&proc); nil) : (v == nil || (v.respond_to?(:empty) && v.empty?)) };
          hash = opts.delete_if(&proc)
          hash.delete_if { |k, v| (v == nil || (v.respond_to?(:empty) && v.empty?)) }
        end

        def add_xml request_id
          req = XmlActions.header
          req['qbxml']['qbxml_msgs_rq']["#{class_name}_add_rq"] = {"xml_attributes"=>
              {"requestID"=>"#{request_id}"},
                "#{class_name}_add"=> self.ordered_fields
              }
          self.class.qbxml(req)
        end


        def modify_xml request_id
          req = XmlActions.header
          req['qbxml']['qbxml_msgs_rq']["#{class_name}_mod_rq"] = {"xml_attributes"=>
              {"requestID"=>"#{request_id}"},
                "#{class_name}_mod"=> self.ordered_fields
              }
          self.class.qbxml(req)
        end

    end
  end
end
