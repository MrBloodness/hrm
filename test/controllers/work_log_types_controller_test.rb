require 'test_helper'

class WorkLogTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_log_type = work_log_types(:one)
  end

  test "should get index" do
    get work_log_types_url
    assert_response :success
  end

  test "should get new" do
    get new_work_log_type_url
    assert_response :success
  end

  test "should create work_log_type" do
    assert_difference('WorkLogType.count') do
      post work_log_types_url, params: { work_log_type: {  } }
    end

    assert_redirected_to work_log_type_url(WorkLogType.last)
  end

  test "should show work_log_type" do
    get work_log_type_url(@work_log_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_log_type_url(@work_log_type)
    assert_response :success
  end

  test "should update work_log_type" do
    patch work_log_type_url(@work_log_type), params: { work_log_type: {  } }
    assert_redirected_to work_log_type_url(@work_log_type)
  end

  test "should destroy work_log_type" do
    assert_difference('WorkLogType.count', -1) do
      delete work_log_type_url(@work_log_type)
    end

    assert_redirected_to work_log_types_url
  end
end