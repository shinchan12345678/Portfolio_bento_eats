require "test_helper"

class Owner::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get owner_owners_show_url
    assert_response :success
  end
end
