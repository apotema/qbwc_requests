module QbwcRequests
  module CustomDetailReport
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :custom_detail_report_type
        field :report_date_macro
        field :report_entity_filter
        field :report_txn_type_filter
        field :report_posting_status_filter
        field :summarize_rows_by
        field :include_column
      end
    end
  end
end
