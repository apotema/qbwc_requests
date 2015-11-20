module Vendor
  module V13
    class Modify < QbwcRequests::Base

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

      validates :name, length: { maximum: 41 }
      validates :company_name, length: { maximum: 41 }
      validates :salutation, length: { maximum: 15 }
      validates :first_name, length: { maximum: 25 }
      validates :middle_name, length: { maximum: 5 }
      validates :last_name, length: { maximum: 25 }
      validates :phone, length: { maximum: 21 }
      validates :alt_phone, length: { maximum: 21 }
      validates :fax, length: { maximum: 21 }
      validates :email, length: { maximum: 1023 }
      validates :contact, length: { maximum: 41 }
      validates :alt_contact, length: { maximum: 41 }
      validates :name_on_check, length: { maximum: 41 }
      validates :account_number, length: { maximum: 99 }
      validates :notes, length: { maximum: 4095 }
    end
  end
end
