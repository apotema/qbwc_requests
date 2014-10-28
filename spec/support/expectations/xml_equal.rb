RSpec::Matchers.define :be_xml_equal_to do |expected|

  def clean xml
    xml.gsub(/>\s+</,"><").strip
  end

  match do |actual|
    clean(actual) == clean(expected)
  end

  failure_message do |actual|
    "expected that: \n#{clean(actual)} to be the same xml as \n#{clean(expected)}"
  end

end