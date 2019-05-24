require 'test_helper'

class EmployeeStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_state = employee_states(:one)
  end

  test "should get index" do
    get employee_states_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_state_url
    assert_response :success
  end

  test "should create employee_state" do
    assert_difference('EmployeeState.count') do
      post employee_states_url, params: { employee_state: {  } }
    end

    assert_redirected_to employee_state_url(EmployeeState.last)
  end

  test "should show employee_state" do
    get employee_state_url(@employee_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_state_url(@employee_state)
    assert_response :success
  end

  test "should update employee_state" do
    patch employee_state_url(@employee_state), params: { employee_state: {  } }
    assert_redirected_to employee_state_url(@employee_state)
  end

  test "should destroy employee_state" do
    assert_difference('EmployeeState.count', -1) do
      delete employee_state_url(@employee_state)
    end

    assert_redirected_to employee_states_url
  end
end
