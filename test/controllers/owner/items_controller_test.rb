require "test_helper"

class Owner::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_items_index_url
    assert_response :success
  end

  test "should get new" do
    get owner_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get owner_items_edit_url
    assert_response :success
  end
end
