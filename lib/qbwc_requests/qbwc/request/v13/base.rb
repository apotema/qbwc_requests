module Qbwc
  module Request
    module V13
      class Base < Qbwc::Request::Base

        def self.qbxml hash
          Qbxml.new(:qb, '13.0').to_qbxml(hash)
        end
        
      end
    end
  end
end
