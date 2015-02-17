class User < ActiveRecord::Base
  include ValidateUserAttributes

  validates :user_name, presence: true, uniqueness: true
  validates_with UserAttributesInputFormat, fields: [:user_name, :password]

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
