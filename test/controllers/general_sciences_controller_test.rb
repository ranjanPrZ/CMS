require "test_helper"

class GeneralSciencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_sciences_index_url
    assert_response :success
  end

  test "should get new" do
    get general_sciences_new_url
    assert_response :success
  end

  test "should get create" do
    get general_sciences_create_url
    assert_response :success
  end
end
