module Qbwc 
  module Request
    module V07
      class Estimate < Qbwc::Request::Base

        ref_to :customer, 209
        field :estimate_line_add

        validates :customer_ref, presence: true
        validates :estimate_line_add, presence: true
      end
    end
  end
end
