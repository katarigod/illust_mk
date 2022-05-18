require "test_helper"

class Admins::RevenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_revenues_index_url
    assert_response :success
  end
end
