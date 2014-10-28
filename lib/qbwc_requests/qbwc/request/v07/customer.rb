module Qbwc 
  module Request
    module V07
      class Customer < Base

        field :name
        field :is_active
        field :company_name
        field :salutation
        field :first_name
        field :middle_name
        field :last_name
        field :suffix
        field :job_title
        field :phone
        field :mobile
        field :pager
        field :alt_phone
        field :fax
        field :email
        field :cc
        field :contact
        field :parent_ref

        validates :name, presence: true
      end
    end
  end
end