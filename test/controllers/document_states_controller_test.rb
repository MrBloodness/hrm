require 'test_helper'

class DocumentStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_state = document_states(:one)
  end

  test "should get index" do
    get document_states_url
    assert_response :success
  end

  test "should get new" do
    get new_document_state_url
    assert_response :success
  end

  test "should create document_state" do
    assert_difference('DocumentState.count') do
      post document_states_url, params: { document_state: {  } }
    end

    assert_redirected_to document_state_url(DocumentState.last)
  end

  test "should show document_state" do
    get document_state_url(@document_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_state_url(@document_state)
    assert_response :success
  end

  test "should update document_state" do
    patch document_state_url(@document_state), params: { document_state: {  } }
    assert_redirected_to document_state_url(@document_state)
  end

  test "should destroy document_state" do
    assert_difference('DocumentState.count', -1) do
      delete document_state_url(@document_state)
    end

    assert_redirected_to document_states_url
  end
end
