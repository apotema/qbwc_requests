module QbwcRequests
  module GeneralDetailReport
    module V07
      class Query < QbwcRequests::Base
        field :max_returned
        field :general_detail_report_type
        field :report_period
        field :report_date_macro
        field :report_entity_filter
        field :report_account_filter
        field :report_txn_type_filter
        field :report_modified_date_range_macro
        field :include_column
      end
    end
  end
end
