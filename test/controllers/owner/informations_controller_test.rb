require "test_helper"

class Owner::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get owner_informations_new_url
    assert_response :success
  end
end
