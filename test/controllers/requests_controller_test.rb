require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:admin).id
    @my_trap = traps(:one)
    @my_request = requests(:one)
  end

  test "should get show" do
    get :show, id: @my_request, trap_name: @my_trap.name
    assert_response :success
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id:@my_request, trap_name: @my_trap.name
    end

    assert_redirected_to trap_path(trap_name: @my_trap.name)
  end

end
