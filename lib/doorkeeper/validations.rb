module Doorkeeper
  module Validations
    extend ActiveSupport::Concern

    attr_accessor :error

    def validate
      puts "validations validate"
      @error = nil

      self.class.validations.each do |validation|
        puts "validation: #{validation}"
        @error = validation[:options][:error] unless send("validate_#{validation[:attribute]}")
        puts "validations error: #{@error}"
        break if @error
      end
    end

    def valid?
      validate
      @error.nil?
    end

    module ClassMethods
      def validate(attribute, options = {})
        validations << { attribute: attribute, options: options }
      end

      def validations
        @validations ||= []
      end
    end
  end
end
