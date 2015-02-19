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
        field :phone
        field :email
        field :contact
        field :name_on_check
        field :is_vendor_eligible_for_1099
        field :open_balance

        validates :name, presence: true
        
      end
    end
  end
end
