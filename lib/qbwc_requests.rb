require "active_model"
require "qbwc_requests/version"
require "qbwc_requests/ordered_fields"
require "qbwc_requests/xml_actions"
require "qbwc_requests/base"
require "qbwc_requests/factory"
require "qbxml"

require "account_qbxml"
require "customer_qbxml"
require "bill_qbxml"
require "customer_qbxml"
require "estimate_qbxml"
require "general_detail_report_qbxml"
require "invoice_qbxml"
require "item_discount_qbxml"
require "item_group_qbxml"
require "item_non_inventory_qbxml"
require "item_other_charge_qbxml"
require "item_payment_qbxml"
require "item_qbxml"
require "item_service_qbxml"
require "item_subtotal_qbxml"
require "job_report_qbxml"
require "purchase_order_qbxml"
require "vendor_qbxml"

dir_name = File.dirname(__FILE__)

Dir["#{dir_name}/qbwc_requests/account/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/bill/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/customer/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/estimate/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/general_detail_report/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/invoice/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/item_discount/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/item_group/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/item_non_inventory/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/item_other_charge/**/*.rb"].each {|f| require f}
Dir["#{dir_name}/qbwc_requests/vendor/**/*.rb"].each {|f| require f}

Dir["#{dir_name}/qbwc_requests/sub_models/*.rb"].each {|f| require f}

module QbwcRequests
  # Your code goes here...
  @@QBXML_VERSION = "07"

  def self.QBXML_VERSION
    @@QBXML_VERSION    
  end

  def self.QBXML_VERSION= version
    @@QBXML_VERSION = version
  end

end
