require "qbwc_requests/version"
require "active_model"
require "qbxml"

Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/request/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/qbwc_requests/qbwc/**/*.rb"].each {|f| require f}

module QbwcRequests
  # Your code goes here...
end
