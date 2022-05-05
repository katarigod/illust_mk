require "test_helper"

class Customers::PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_pictures_index_url
    assert_response :success
  end

  test "should get new" do
    get customers_pictures_new_url
    assert_response :success
  end

  test "should get show" do
    get customers_pictures_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_pictures_edit_url
    assert_response :success
  end
end
