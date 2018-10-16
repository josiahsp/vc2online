require 'test_helper'

class YouversionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @youversion = youversions(:one)
  end

  test "should get index" do
    get youversions_url
    assert_response :success
  end

  test "should get new" do
    get new_youversion_url
    assert_response :success
  end

  test "should create youversion" do
    assert_difference('Youversion.count') do
      post youversions_url, params: { youversion: { eventnumber: @youversion.eventnumber, series: @youversion.series, start: @youversion.start, title: @youversion.title } }
    end

    assert_redirected_to youversion_url(Youversion.last)
  end

  test "should show youversion" do
    get youversion_url(@youversion)
    assert_response :success
  end

  test "should get edit" do
    get edit_youversion_url(@youversion)
    assert_response :success
  end

  test "should update youversion" do
    patch youversion_url(@youversion), params: { youversion: { eventnumber: @youversion.eventnumber, series: @youversion.series, start: @youversion.start, title: @youversion.title } }
    assert_redirected_to youversion_url(@youversion)
  end

  test "should destroy youversion" do
    assert_difference('Youversion.count', -1) do
      delete youversion_url(@youversion)
    end

    assert_redirected_to youversions_url
  end
end
