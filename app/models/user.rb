#
# Validation class. Validate non alphanumeric chars.
#
class UserAttrFormat < ActiveModel::Validator
  SYMBOL_SET = %w{! ? @ # % ^ & * ( ) = + |}

  def validate(record)
    if options[:fields].any? do |field|
      include = false
      unless record.send(field).nil?
        SYMBOL_SET.each do |symbol|
          if record.send(field).include?(symbol)
            record.errors[:base] << "Contains ancceptable symbol."
            include = true
            break
          end
        end
        break if include
      end
    end
    end
  end
end

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates_with UserAttrFormat, fields: [:user_name, :password_digest]
  #
  # If value not nil and if value does not contain upper case letters => not valid
  #
  validates_each :user_name, :password_digest do |record, attr, value|
    unless value.nil?
      record.errors.add(attr, "must include at least 1 upper case letter.") if value.match(/[A-Z]/).nil?
    end
  end

  has_secure_password

  after_destroy :ensure_if_admin_remains

  private
  #
  # Raise an exception if try to delete only User record.
  #
  def ensure_if_admin_remains
    raise "Can't delete last admin user." if User.count.zero?
  end
end
