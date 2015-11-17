RSpec::Matchers.define :be_xml_equal_to do |expected|

  def clean xml
    xml.gsub(/>\s+</,"><").strip
  end

  match do |actual|
    clean(actual) == clean(expected)
  end

  failure_message do |actual|
    "EXPECTED: \n#{clean(expected).colorize(:green)} 
    \nFOUND: \n#{clean(actual).colorize(:red)}
    "
  end

end
