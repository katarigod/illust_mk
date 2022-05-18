require "test_helper"

class Admins::PublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_publics_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_publics_show_url
    assert_response :success
  end
end
