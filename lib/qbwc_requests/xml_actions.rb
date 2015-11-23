module QbwcRequests
  module XmlActions
   def self.query req, options, header
      hash = {"qbxml"=>
              {"xml_attributes"=> {},
               "qbxml_msgs_rq"=>
                {"xml_attributes" => {"onError"=>"stopOnError"},
                 "#{req}"=>
                  {"xml_attributes"=> self.header_attributes(header)}.merge(options)
                }
              }
            }
    end

    def self.header_attributes attributes = {}
      hash = {}
      if attributes
        hash["requestID"] = attributes["requestID"] if attributes["requestID"]
      end
      hash
    end

    def self.header
      {"qbxml"=>
        {"xml_attributes"=>{}, "qbxml_msgs_rq"=>
          {"xml_attributes"=>{"onError"=>"stopOnError"}}
        }
      }
    end
  end
end
