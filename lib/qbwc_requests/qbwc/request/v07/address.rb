module Qbwc
  module Request
    module V07
      class Address < Qbwc::Request::Base

        field :addr1
        field :addr2
        field :addr3
        field :addr4
        field :addr5
        field :city
        field :state
        field :postal_code
        field :country
        field :note

        validates :addr1, length: { maximum: 41 }
        validates :addr2, length: { maximum: 41 }
        validates :addr3, length: { maximum: 41 }
        validates :addr4, length: { maximum: 41 }
        validates :addr5, length: { maximum: 41 }
        validates :city, length: { maximum: 41 }
        validates :state, length: { maximum: 21 }
        validates :postal_code, length: { maximum: 13 }
        validates :country, length: { maximum: 31 }
        validates :note, length: { maximum: 41 }
      end
    end
  end
end
