require "test_helper"

class DataImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get data_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get data_imports_create_url
    assert_response :success
  end
end
