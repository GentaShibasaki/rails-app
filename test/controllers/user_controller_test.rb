require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_top_url
    assert_response :success
  end

end
