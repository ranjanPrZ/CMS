# frozen_string_literal: true

require 'test_helper'

class ReasoningsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get reasonings_index_url
    assert_response :success
  end

  test 'should get new' do
    get reasonings_new_url
    assert_response :success
  end

  test 'should get create' do
    get reasonings_create_url
    assert_response :success
  end
end
