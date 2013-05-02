module QuestionMarkMethod
  def method_missing(method_name)
    if md = /\?$/.match(method_name.to_s)
      return_boolean_value_of_attribute_related_with(md.pre_match)
    else
      super
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def add_question_mark_methods(options)
      self.class_eval do
        options.each do |new_method_name, old_method_name|
          define_method new_method_name do
            return_boolean_value_of_attribute_related_with(old_method_name.to_s)
          end
        end
      end
    end
  end

  private
  def return_boolean_value_of_attribute_related_with(method_name)
    attribute = "@" + method_name
    !!instance_variable_get(attribute)
  end
end
