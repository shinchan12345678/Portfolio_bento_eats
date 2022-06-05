require "test_helper"

class Public::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_owners_index_url
    assert_response :success
  end

  test "should get show" do
    get public_owners_show_url
    assert_response :success
  end
end
