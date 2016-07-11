module QbwcRequests
  module GeneralDetailReport
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :general_detail_report_type
        field :report_entity_filter
        field :include_column
      end
    end
  end
end
