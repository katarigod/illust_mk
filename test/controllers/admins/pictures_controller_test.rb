require "test_helper"

class Admins::PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_pictures_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_pictures_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_pictures_edit_url
    assert_response :success
  end
end
