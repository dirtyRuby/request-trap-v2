require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:admin).id
    @my_trap = traps(:one)
    @my_request = requests(:one)
  end
  test "should get show" do
    get :show, id: @my_request.id, trap_name: @my_trap.name
    assert_response :success
  end

end
