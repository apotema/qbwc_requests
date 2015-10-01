module Qbwc
  module Request
    module V07
      class Vendor < Qbwc::Request::Base

        field :name
        field :is_active
        field :company_name
        field :salutation
        field :first_name
        field :middle_name
        field :last_name
        field :vendor_address
        field :phone
        field :alt_phone
        field :fax
        field :email
        field :contact
        field :alt_contact
        field :name_on_check
        field :account_number
        field :notes
        field :is_vendor_eligible_for_1099
        field :open_balance

        validates :name, presence: true

      end
    end
  end
end
