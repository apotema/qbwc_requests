require 'spec_helper'

describe VendorQbxml::Query do
  
  context "V07" do
    it_behaves_like 'queryable'
  end

  context "V13" do
    it_behaves_like 'queryable', "13"
  end

end
