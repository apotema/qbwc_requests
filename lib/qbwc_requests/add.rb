module QbwcRequests
  class Add < QbwcRequests::Base

    def to_xml request_id
      self.valid? ? add_xml(request_id) : self
    end

  end
end
