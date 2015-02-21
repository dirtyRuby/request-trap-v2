require 'test_helper'

class TrapsControllerTest < ActionController::TestCase


  setup do
    session[:user_id] = users(:admin).id
    @my_trap1 = traps(:one)
    @my_trap2 = traps(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, trap_name: @my_trap1.name
    assert_response :success
  end

  test "should update trap" do
    patch :update, trap_name: @my_trap2, trap: {name: 'New name'}
    assert_redirected_to trap_path(trap_name: 'New name')
  end

  test "should destroy trap" do
    assert_difference('Trap.count', -1) do
      delete :destroy, trap_name: @my_trap2.name, id: @my_trap2
    end
  end

  test "should capture GET request" do
    assert_difference('Trap.count') do
      get :capture_request, trap_name: 'mysecreturl'
    end
    assert_difference('Request.count', +1) do
      get :capture_request, trap_name: 'mysecreturl2'
    end

    assert_redirected_to traps_path
  end

  test "should capture POST request" do
    assert_difference('Trap.count', +1) do
      post :capture_request, trap_name: 'mysecreturl'
    end
    assert_difference('Request.count', +1) do
      post :capture_request, trap_name: 'mysecreturl2'
    end
    assert_redirected_to traps_path
  end

  test "should capture PUT request" do
    assert_difference('Trap.count', +1) do
      put :capture_request, trap_name: 'mysecreturl'
    end
    assert_difference('Request.count', +1) do
      put :capture_request, trap_name: 'mysecreturl2'
    end

    assert_redirected_to traps_path
  end

  test "should capture PATCH request" do
    assert_difference('Trap.count', +1) do
      patch :capture_request, trap_name: 'mysecreturl'
    end
    assert_difference('Request.count', +1) do
      patch :capture_request, trap_name: 'mysecreturl2'
    end

    assert_redirected_to traps_path
  end

  test "should capture DELETE request" do
    assert_difference('Trap.count', +1) do
      delete :capture_request, trap_name: 'mysecreturl'
    end
    assert_difference('Request.count', +1) do
      delete :capture_request, trap_name: 'mysecreturl2'
    end

    assert_redirected_to traps_path
  end

  test "should not create new trap if already exists" do
    assert_difference('Trap.count', 0) do
      delete :capture_request, trap_name: @my_trap1.name
      end
    assert_difference('Request.count') do
      delete :capture_request, trap_name: @my_trap1.name
    end

    assert_redirected_to traps_path
  end

  test "should not access any action without authorization" do
    session[:user_id] = nil
    authorization_required :get, :index
    authorization_required :get, :show, trap_name: @my_trap1.name
    authorization_required :patch, :update, trap_name: @my_trap2, trap: {name: 'New name'}
    authorization_required :delete, :destroy, trap_name: @my_trap2.name, id: @my_trap2
  end

end
