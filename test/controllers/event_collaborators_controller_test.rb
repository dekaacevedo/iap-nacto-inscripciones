require 'test_helper'

class EventCollaboratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_collaborators_create_url
    assert_response :success
  end

  test "should get edit" do
    get event_collaborators_edit_url
    assert_response :success
  end

  test "should get update" do
    get event_collaborators_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_collaborators_destroy_url
    assert_response :success
  end

end
