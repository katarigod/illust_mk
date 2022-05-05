require "test_helper"

class Customers::PublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_publics_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_publics_edit_url
    assert_response :success
  end
end
