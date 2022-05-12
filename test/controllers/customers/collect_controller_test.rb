require "test_helper"

class Customers::CollectControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_collect_show_url
    assert_response :success
  end
end
