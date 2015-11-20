module Customer
  module V07
    class Add < QbwcRequests::Base

      field :name
      field :is_active
      ref_to :parent, 1000
      field :company_name
      field :salutation
      field :first_name
      field :middle_name
      field :last_name
      field :bill_address
      field :ship_address
      field :phone
      field :alt_phone
      field :fax
      field :email
      field :contact
      field :alt_contact

      validates :name, presence: true, length: { maximum: 41 }
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
      
    end
  end
end
