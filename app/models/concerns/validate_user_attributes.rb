module ValidateUserAttributes
  extend ActiveSupport::Concern

  NON_ALPHANUMERIC = Regexp.new(/[^0-9A-Za-z]/)
  UPPER_CASE = Regexp.new(/[A-Z]/)
  LOWER_CASE = Regexp.new(/[a-z]/)

  class UserAttributesIputFromat < ActiveModel::Validator
    METHOD_LIST = [:upper_case_match, :lower_case_match, :unacceptable_sym_match]
    def validate(record)
      matched = false
      if options[:fields].any? do |field|
        unless record.send(field).nil?
          METHOD_LIST.each do |method|
            if UserAttributesIputFromat.send(method, record.send(field), record)
              matched = true
              break
            end
          end
          break if matched
        end
      end
      end
    end

    def self.upper_case_match(value, record)
      if value.match(UPPER_CASE).nil?
        record.errors[:base] << "User name or password contains must contain at least one upper case letter."
        true
      end
    end

    def self.lower_case_match(value, record)
      if value.match(LOWER_CASE).nil?
        record.errors[:base] << "User name or password contains must contain at least one lower case letter."
        true
      end
    end

    def self.unacceptable_sym_match(value, record)
      if value.match(NON_ALPHANUMERIC)
        record.errors[:base] << "User name or password contains unacceptable symbols. A-Z, a-z, 0-1 are allowed only."
        true
      end
    end
  end

end