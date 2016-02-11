module QbwcRequests
  module JobReport
    module V07
      class Query < QbwcRequests::Base
        field :job_report_type
        field :report_entity_filter
      end
    end
  end
end
