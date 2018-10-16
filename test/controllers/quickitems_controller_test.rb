require 'test_helper'

class QuickitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quickitem = quickitems(:one)
  end

  test "should get index" do
    get quickitems_url
    assert_response :success
  end

  test "should get new" do
    get new_quickitem_url
    assert_response :success
  end

  test "should create quickitem" do
    assert_difference('Quickitem.count') do
      post quickitems_url, params: { quickitem: { order: @quickitem.order, path: @quickitem.path, title: @quickitem.title } }
    end

    assert_redirected_to quickitem_url(Quickitem.last)
  end

  test "should show quickitem" do
    get quickitem_url(@quickitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_quickitem_url(@quickitem)
    assert_response :success
  end

  test "should update quickitem" do
    patch quickitem_url(@quickitem), params: { quickitem: { order: @quickitem.order, path: @quickitem.path, title: @quickitem.title } }
    assert_redirected_to quickitem_url(@quickitem)
  end

  test "should destroy quickitem" do
    assert_difference('Quickitem.count', -1) do
      delete quickitem_url(@quickitem)
    end

    assert_redirected_to quickitems_url
  end
end
