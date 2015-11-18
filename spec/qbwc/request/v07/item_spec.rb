require 'spec_helper'

describe Qbwc::Request::V07::Item do
  
  # it_behaves_like 'queryable'

  it "must not respond to add" do
    expect(subject).not_to respond_to(:add)
  end

  it "must not respond to modify" do
    expect(subject).not_to respond_to(:modify)
  end

end
