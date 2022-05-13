require "test_helper"

class Admins::BuycoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_buycoins_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_buycoins_show_url
    assert_response :success
  end
end
