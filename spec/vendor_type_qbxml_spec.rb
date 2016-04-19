require 'spec_helper'

describe VendorTypeQbxml do

  describe VendorTypeQbxml::Query do

    context "V07" do
      it_behaves_like 'queryable'
    end

  end

end
