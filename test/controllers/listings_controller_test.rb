require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  test "should get seller" do
    get :seller
    assert_response :success
  end

end
