require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @correct_user_attribute = "Coreect1"
    @incorrect_user_attribute = "incorrect"
    @incorrect_user_attributes_set1 = %w(u*ser1R #user1R @user1R ?user1R !user1R USER user)
    @incorrect_user_attributes_set2 = %w(PASSWORD password 123456)
  end

  test "should not duplicate users" do
    user = User.new(user_name: "Admin1", password: "Admin1")
    assert user.invalid?
  end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:user_name].any?
    assert user.errors[:password].any?
  end

  test "user name and password must contain only numbers and letters" do
    assert create_user(@correct_user_attribute, @correct_user_attribute).valid?
  end

  test "user name not valid if contain non alphanumeric chars" do
    @incorrect_user_attributes_set1.each do |user_name|
      assert create_user(user_name, @correct_user_attribute).invalid?
    end
  end

  test "user name not valid with only capital letters, only small letters or only nu,bers" do
    @incorrect_user_attributes_set2.each do |user_name|
      assert create_user(user_name, @correct_user_attribute).invalid?
    end
  end

  test "password not valid if contain non alphanumeric chars" do
    @incorrect_user_attributes_set1.each do |password|
      assert create_user(@correct_user_attribute, password).invalid?
    end
  end

  test "password not valid with only capital letters, only small letters or only nu,bers" do
    @incorrect_user_attributes_set2.each do |password|
      assert create_user(@correct_user_attribute, password).invalid?
    end
  end

  private
  def create_user user_name, password
    User.new(user_name: user_name, password: password)
  end
end
