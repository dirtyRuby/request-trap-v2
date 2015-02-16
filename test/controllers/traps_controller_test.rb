require 'test_helper'

class TrapsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:admin).id
    @my_trap = traps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, trap_name: @my_trap.name
    assert_response :success
  end

end
