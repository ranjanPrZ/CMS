require "test_helper"

class QuantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quants_index_url
    assert_response :success
  end

  test "should get new" do
    get quants_new_url
    assert_response :success
  end
end
