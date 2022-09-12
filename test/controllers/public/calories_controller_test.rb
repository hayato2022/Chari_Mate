require "test_helper"

class Public::CaloriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_calories_index_url
    assert_response :success
  end

  test "should get calory" do
    get public_calories_calory_url
    assert_response :success
  end
end
