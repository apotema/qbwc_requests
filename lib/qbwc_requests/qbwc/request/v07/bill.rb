module Qbwc 
  module Request
    module V07
      class Bill < Qbwc::Request::Base
        ref_to :vendor, 41
      end
    end
  end
end
