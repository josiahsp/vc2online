require 'test_helper'

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prayers_index_url
    assert_response :success
  end

  test "should get new" do
    get prayers_new_url
    assert_response :success
  end

  test "should get update" do
    get prayers_update_url
    assert_response :success
  end

end
