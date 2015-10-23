require 'spec_helper'

RSpec.describe Qbwc::Request::V07::SubModel::Vendor do

  it "should validate the presence of the ListID or the full name" do

    subject.list_ID = "list_Id"
    subject.full_name = "full name"
    expect(subject.valid?).to be false

  end

end
