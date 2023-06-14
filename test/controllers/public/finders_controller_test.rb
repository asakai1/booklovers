require "test_helper"

class Public::FindersControllerTest < ActionDispatch::IntegrationTest
  test "should get finder" do
    get public_finders_finder_url
    assert_response :success
  end
end
