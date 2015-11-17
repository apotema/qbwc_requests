module QbwcRequests
  module V13
    class Base < QbwcRequests::Base

      def self.qbxml hash
        Qbxml.new(:qb, '13.0').to_qbxml(hash)
      end

    end
  end
end
