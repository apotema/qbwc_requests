module Qbwc 
  module Request
    module V07
      class Account < Qbwc::Request::Base

        field :name

        validates :name, presence: true
        
      end
    end
  end
end
