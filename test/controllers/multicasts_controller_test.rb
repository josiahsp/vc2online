require 'test_helper'

class MulticastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multicast = multicasts(:one)
  end

  test "should get index" do
    get multicasts_url
    assert_response :success
  end

  test "should get new" do
    get new_multicast_url
    assert_response :success
  end

  test "should create multicast" do
    assert_difference('Multicast.count') do
      post multicasts_url, params: { multicast: { author: @multicast.author, duration: @multicast.duration, guid: @multicast.guid, image: @multicast.image, keywords: @multicast.keywords, pubdate: @multicast.pubdate, subtitle: @multicast.subtitle, summary: @multicast.summary, title: @multicast.title } }
    end

    assert_redirected_to multicast_url(Multicast.last)
  end

  test "should show multicast" do
    get multicast_url(@multicast)
    assert_response :success
  end

  test "should get edit" do
    get edit_multicast_url(@multicast)
    assert_response :success
  end

  test "should update multicast" do
    patch multicast_url(@multicast), params: { multicast: { author: @multicast.author, duration: @multicast.duration, guid: @multicast.guid, image: @multicast.image, keywords: @multicast.keywords, pubdate: @multicast.pubdate, subtitle: @multicast.subtitle, summary: @multicast.summary, title: @multicast.title } }
    assert_redirected_to multicast_url(@multicast)
  end

  test "should destroy multicast" do
    assert_difference('Multicast.count', -1) do
      delete multicast_url(@multicast)
    end

    assert_redirected_to multicasts_url
  end
end
