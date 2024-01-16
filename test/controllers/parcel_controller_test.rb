require "test_helper"

class ParcelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parcel_index_url
    assert_response :success
  end

  test "should get show" do
    get parcel_show_url
    assert_response :success
  end

  test "should get create" do
    get parcel_create_url
    assert_response :success
  end

  test "should get destroy" do
    get parcel_destroy_url
    assert_response :success
  end
end
