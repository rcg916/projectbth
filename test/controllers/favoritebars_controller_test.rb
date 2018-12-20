require 'test_helper'

class FavoritebarsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get favoritebars_update_url
    assert_response :success
  end

end
