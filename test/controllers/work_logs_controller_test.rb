require 'test_helper'

class WorkLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get work_logs_new_url
    assert_response :success
  end

  test "should get edit" do
    get work_logs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get work_logs_destroy_url
    assert_response :success
  end

  test "should get show" do
    get work_logs_show_url
    assert_response :success
  end

  test "should get index" do
    get work_logs_index_url
    assert_response :success
  end

end
