module QbwcRequests
  class Base

    include QbwcRequests::OrderedFields
    include QbwcRequests::XmlActions

    def to_xml request_id
      self.valid? ? xml(request_id, self.class.name.demodulize) : self
    end

    def initialize(attributes = {})
      @attributes = compact(attributes)
      @attributes.each do |name, value|
        self.instance_variable_set("@#{name}", value) if value.present?
      end
    end

    def self.qbxml hash
      Qbxml.new(:qb, "#{version.to_i}.0").to_qbxml(hash)
    end

    def class_name
      self.class.underscore(self.class.name.split("::")[1].gsub("Qbxml",""))
    end

    def self.version
      self.name.split("::")[2].gsub("V","")
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

      def xml request_id, action
        req = XmlActions.header
        if action != "Query"
          req['qbxml']['qbxml_msgs_rq']["#{class_name}_#{action}_rq"] = {"xml_attributes"=>
              {"requestID"=>"#{request_id}"},
                "#{class_name}_#{action}"=> self.ordered_fields
              }  
        else
          req['qbxml']= {
            'qbxml_msgs_rq' => { 
              "xml_attributes" => {
                "onError"=>"stopOnError"
              }, 
              "#{class_name}_query_rq" => { 
                "xml_attributes" => {
                  "requestID" => "#{request_id}"} 
                }.merge(self.ordered_fields) 
            } 
          }
        end
        self.class.qbxml(req)
      end

  end
end
