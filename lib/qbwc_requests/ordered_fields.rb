module QbwcRequests
  module OrderedFields
    module ClassMethods
      def field attribute_name
        @attr_order ||= Set.new
        @attr_order << attribute_name
        attr_accessor attribute_name
      end
      def has_one attribute_name, klass
        @attr_order ||= Set.new
        @attr_order << attribute_name
        attr_accessor attribute_name
        validates_each attribute_name do |record, attribute, value|
          if !value.blank? and value.class != klass
            record.errors.add(attribute, "must be of type #{klass}") 
          end
        end
      end
      def ref_to attribute_prefix, name_length
        attribute_name = "#{attribute_prefix}_ref".to_sym
        @attr_order ||= Set.new
        @attr_order << attribute_name
        attr_accessor attribute_name
        validates_each attribute_name do |record, attribute, value|
          if value.present? 
            if value.is_a?(Hash)
              if !(value[:list_id].present? ^ value[:full_name].present?)
                record.errors.add(attribute, "Must have list_id or full_name")
              elsif value.fetch(:full_name, "").length > name_length
                record.errors.add(attribute, "- maximum 'full name' length is: #{name_length}")
              end
            else
              record.errors.add(attribute, "Must have the format {list_id: 'value'} or {full_name: 'value'}")
            end
          end
        end
      end
      def attr_order
        @attr_order
      end
    end

    class SubModelsValidator < ActiveModel::Validator
      def validate record
        for field in record.class.attr_order
          value = record.send(field)
          if value.respond_to?(:valid?) and value.invalid?
            for error in value.errors
              record.errors.add("#{field}##{error}", value.errors.messages[error] )
            end
          end
        end
      end
    end

    def self.included(base)
      base.extend(ActiveModel::Naming)
      base.include(ActiveModel::Validations)
      base.include(ActiveModel::Conversion)
      base.extend(ClassMethods)
      base.validates_with(SubModelsValidator)
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
