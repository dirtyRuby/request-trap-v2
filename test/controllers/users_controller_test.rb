require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @new_user = {user_name: "Visitor1"}
    session[:user_id] = @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { password: 'Secret1', password_confirmation: 'Secret1', user_name: 'Visitor2' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user

    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user

    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { password: 'Secret', password_confirmation: 'Secret', user_name: @new_user }

    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should not access any action without authorization" do
    session[:user_id] = nil
    authorization_required :get, :index
    authorization_required :get, :show, id: @user
    authorization_required :get, :edit, id: @user
    authorization_required :post, :create, user: { password: 'Secret1', password_confirmation: 'Secret1', user_name: 'Visitor2' }
    authorization_required :patch, :update, id: @user, user: { password: 'Secret', password_confirmation: 'Secret', user_name: @new_user }
    authorization_required :delete, :destroy, id: @user
  end

end
