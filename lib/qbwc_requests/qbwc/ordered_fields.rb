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

    def validate_ordered_fields
      for attribute in self.class.attr_order
        value = send(attribute)
        if value.present?
          if value.respond_to?(:ordered_fields)
            validate_ordered_field(attribute, value)
          end
        end
      end
    end

    private

    def validate_ordered_field(parent_attribute, value)
      if value.invalid?
        value.errors.each do |attribute, error|
          errors.add(composite_attribute_name(parent_attribute, attribute), error)
        end
      end
    end

    def composite_attribute_name(parent_attribute, attribute)
      "#{parent_attribute}_#{attribute}".to_sym
    end
  end
end
