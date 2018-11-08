require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movie_show_url
    assert_response :success
  end

end
