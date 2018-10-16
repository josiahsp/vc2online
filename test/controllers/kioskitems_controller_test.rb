require 'test_helper'

class KioskitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kioskitem = kioskitems(:one)
  end

  test "should get index" do
    get kioskitems_url
    assert_response :success
  end

  test "should get new" do
    get new_kioskitem_url
    assert_response :success
  end

  test "should create kioskitem" do
    assert_difference('Kioskitem.count') do
      post kioskitems_url, params: { kioskitem: { active: @kioskitem.active, cover_image: @kioskitem.cover_image, endtime: @kioskitem.endtime, path: @kioskitem.path, starttime: @kioskitem.starttime, title: @kioskitem.title } }
    end

    assert_redirected_to kioskitem_url(Kioskitem.last)
  end

  test "should show kioskitem" do
    get kioskitem_url(@kioskitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_kioskitem_url(@kioskitem)
    assert_response :success
  end

  test "should update kioskitem" do
    patch kioskitem_url(@kioskitem), params: { kioskitem: { active: @kioskitem.active, cover_image: @kioskitem.cover_image, endtime: @kioskitem.endtime, path: @kioskitem.path, starttime: @kioskitem.starttime, title: @kioskitem.title } }
    assert_redirected_to kioskitem_url(@kioskitem)
  end

  test "should destroy kioskitem" do
    assert_difference('Kioskitem.count', -1) do
      delete kioskitem_url(@kioskitem)
    end

    assert_redirected_to kioskitems_url
  end
end
