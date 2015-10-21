module Qbwc::Request::V07::Reference
  class Vendor < Qbwc::Request::Base

    field :list_ID
    field :full_name

    validate :list_id_or_full_name

    private

    def list_id_or_full_name
      if !(list_ID.blank? ^ full_name.blank?)
        errors[:base] << "Specify a ListID or a Full Name, not both"
      end
    end

  end
end
