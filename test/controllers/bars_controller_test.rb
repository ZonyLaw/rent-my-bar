require "test_helper"

class BarsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bars_home_url
    assert_response :success
  end

  test "should get show" do
    get bars_show_url
    assert_response :success
  end

  test "should get new" do
    get bars_new_url
    assert_response :success
  end

  test "should get create" do
    get bars_create_url
    assert_response :success
  end

  test "should get update" do
    get bars_update_url
    assert_response :success
  end

  test "should get delete" do
    get bars_delete_url
    assert_response :success
  end

  test "should get edit" do
    get bars_edit_url
    assert_response :success
  end
end
