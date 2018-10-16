require 'test_helper'

class SubmenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submenu = submenus(:one)
  end

  test "should get index" do
    get submenus_url
    assert_response :success
  end

  test "should get new" do
    get new_submenu_url
    assert_response :success
  end

  test "should create submenu" do
    assert_difference('Submenu.count') do
      post submenus_url, params: { submenu: { mainmenu: @submenu.mainmenu, title: @submenu.title } }
    end

    assert_redirected_to submenu_url(Submenu.last)
  end

  test "should show submenu" do
    get submenu_url(@submenu)
    assert_response :success
  end

  test "should get edit" do
    get edit_submenu_url(@submenu)
    assert_response :success
  end

  test "should update submenu" do
    patch submenu_url(@submenu), params: { submenu: { mainmenu: @submenu.mainmenu, title: @submenu.title } }
    assert_redirected_to submenu_url(@submenu)
  end

  test "should destroy submenu" do
    assert_difference('Submenu.count', -1) do
      delete submenu_url(@submenu)
    end

    assert_redirected_to submenus_url
  end
end
