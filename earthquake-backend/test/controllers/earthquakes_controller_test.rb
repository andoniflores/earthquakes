require "test_helper"

class EarthquakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @earthquake = earthquakes(:one)
  end

  test "should get index" do
    get earthquakes_url, as: :json
    assert_response :success
  end

  test "should create earthquake" do
    assert_difference("Earthquake.count") do
      post earthquakes_url, params: { earthquake: { latitude: @earthquake.latitude, longitude: @earthquake.longitude, mag: @earthquake.mag, magType: @earthquake.magType, place: @earthquake.place, time: @earthquake.time, title: @earthquake.title, tsunami: @earthquake.tsunami, url: @earthquake.url } }, as: :json
    end

    assert_response :created
  end

  test "should show earthquake" do
    get earthquake_url(@earthquake), as: :json
    assert_response :success
  end

  test "should update earthquake" do
    patch earthquake_url(@earthquake), params: { earthquake: { latitude: @earthquake.latitude, longitude: @earthquake.longitude, mag: @earthquake.mag, magType: @earthquake.magType, place: @earthquake.place, time: @earthquake.time, title: @earthquake.title, tsunami: @earthquake.tsunami, url: @earthquake.url } }, as: :json
    assert_response :success
  end

  test "should destroy earthquake" do
    assert_difference("Earthquake.count", -1) do
      delete earthquake_url(@earthquake), as: :json
    end

    assert_response :no_content
  end
end
