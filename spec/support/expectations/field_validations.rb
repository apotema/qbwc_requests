RSpec::Matchers.define :validate_field_presence_of do |expected|

  match do |actual|
    object = described_class.factory()
    object.valid?
    object.errors.include? expected
  end

  failure_message do |actual|
    "Expected model to include validation errors for #{expected}"
  end

end
