module Qbwc
  module OrderedFields

    module ClassMethods
      def field attribute_name
        @attr_order ||= []
        @attr_order << attribute_name
        attr_accessor attribute_name
      end
      def attr_order
        @attr_order
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
      base.extend(ActiveModel::Naming)
      base.include(ActiveModel::Validations)
      base.include(ActiveModel::Conversion)
    end

    def ordered_fields
      new_hash = {}
      for attribute in self.class.attr_order
        value = send(attribute)
        if value.present?
          if value.respond_to?(:ordered_fields)
            new_hash[attribute] = value.ordered_fields
          else
            new_hash[attribute] = value
          end
        end
      end
      new_hash
    end
  end
end
