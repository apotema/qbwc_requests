require 'nokogiri'

doc = File.open("qbxmlops60.dtd") { |f| Nokogiri::XML(f) }
