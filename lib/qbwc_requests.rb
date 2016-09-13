require "active_model"
require "qbwc_requests/version"
require "qbwc_requests/ordered_fields"
require "qbwc_requests/xml_actions"
require "qbwc_requests/base"
require "qbwc_requests/factory"

qbxml_models = [
  "account",
  "customer",
  "bill",
  "estimate",
  "general_detail_report",
  "invoice",
  "item_discount",
  "item_group",
  "item_non_inventory",
  "item_other_charge",
  "item_payment",
  "item",
  "item_service",
  "item_subtotal",
  "job_report",
  "purchase_order",
  "ship_method",
  "terms",
  "vendor",
  "vendor_type"
]

def camelize name
  name.split('_').collect(&:capitalize).join
end

dir_name = File.dirname(__FILE__)

for qbxml_model in qbxml_models do
  Object.const_set(
    camelize(qbxml_model+"_qbxml"), 
    Class.new { extend QbwcRequests::Factory }
  )
  Dir["#{dir_name}/qbwc_requests/#{qbxml_model}/**/*.rb"].each {|f| require f}
end

Dir["#{dir_name}/qbwc_requests/sub_models/*.rb"].each {|f| require f}

module QbwcRequests

  @@QBXML_VERSION = "07"

  def self.QBXML_VERSION
    @@QBXML_VERSION    
  end

  def self.QBXML_VERSION= version
    @@QBXML_VERSION = version
  end

end
