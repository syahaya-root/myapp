require "test_helper"

class BootcampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bootcamp = bootcamps(:one)
  end

  test "should get index" do
    get bootcamps_url
    assert_response :success
  end

  test "should get new" do
    get new_bootcamp_url
    assert_response :success
  end

  test "should create bootcamp" do
    assert_difference("Bootcamp.count") do
      post bootcamps_url, params: { bootcamp: { dates: @bootcamp.dates, description: @bootcamp.description, name: @bootcamp.name } }
    end

    assert_redirected_to bootcamp_url(Bootcamp.last)
  end

  test "should show bootcamp" do
    get bootcamp_url(@bootcamp)
    assert_response :success
  end

  test "should get edit" do
    get edit_bootcamp_url(@bootcamp)
    assert_response :success
  end

  test "should update bootcamp" do
    patch bootcamp_url(@bootcamp), params: { bootcamp: { dates: @bootcamp.dates, description: @bootcamp.description, name: @bootcamp.name } }
    assert_redirected_to bootcamp_url(@bootcamp)
  end

  test "should destroy bootcamp" do
    assert_difference("Bootcamp.count", -1) do
      delete bootcamp_url(@bootcamp)
    end

    assert_redirected_to bootcamps_url
  end
end
