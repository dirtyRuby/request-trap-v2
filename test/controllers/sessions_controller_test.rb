require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login user/create session" do
    admin = users(:admin)
    post :create, user_name: admin.user_name, password: "admin"
    assert_redirected_to admin_url
    assert_equal admin.id, session[:user_id]
  end

  test "should fail login" do
    admin = users(:admin)
    post :create, user_name: admin.user_name, password: "notadmin"
    assert_redirected_to login_url
  end

  test "should logout user/destroy session" do
    admin = users(:admin)
    post :create, user_name: admin.user_name, password: "admin"
    assert_equal admin.id, session[:user_id]
    delete :destroy
    assert_redirected_to admin_url
    assert_equal session[:user_id], nil
  end

end
