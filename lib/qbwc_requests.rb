require "active_model"
require "qbwc_requests/version"
require "qbwc_requests/ordered_fields"
require "qbwc_requests/base"

require "qbxml"

Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/request/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/vendor_qbxml/**/*.rb"].each {|f| require f}

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
