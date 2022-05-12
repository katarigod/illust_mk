require "test_helper"

class Customers::BuycoinControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_buycoin_new_url
    assert_response :success
  end
end
