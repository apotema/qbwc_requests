module QbwcRequests
  module V13
    class Add < QbwcRequests::V13::Base

      def to_xml request_id
        self.valid? ? add_xml(request_id) : self
      end

    end
  end
end
