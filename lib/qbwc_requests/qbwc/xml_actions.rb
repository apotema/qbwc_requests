module Qbwc
  module XmlActions

    def self.query req, options
      hash = {"qbxml"=>
              {"xml_attributes"=>{},
               "qbxml_msgs_rq"=>
                {"xml_attributes"=>{"onError"=>"stopOnError"},
                 "#{req}"=>
                  {"xml_attributes"=>{}}.merge(options)
                }
              }
            }
      self.to_xml(hash)
    end

    def self.header
      {"qbxml"=>
        {"xml_attributes"=>{}, "qbxml_msgs_rq"=>
          {"xml_attributes"=>{"onError"=>"stopOnError"}}
        }
      }
    end

    def self.to_xml hash
      "<?xml version='1.0' encoding='utf-8'?>#{Qbxml.new.to_qbxml(hash)}"
    end

  end
end
