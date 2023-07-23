require 'test_helper'

class Api::V1::LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_library = api_v1_libraries(:one)
  end

  test "should get index" do
    get api_v1_libraries_url, as: :json
    assert_response :success
  end

  test "should create api_v1_library" do
    assert_difference('Api::V1::Library.count') do
      post api_v1_libraries_url, params: { api_v1_library: { name: @api_v1_library.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_library" do
    get api_v1_library_url(@api_v1_library), as: :json
    assert_response :success
  end

  test "should update api_v1_library" do
    patch api_v1_library_url(@api_v1_library), params: { api_v1_library: { name: @api_v1_library.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_library" do
    assert_difference('Api::V1::Library.count', -1) do
      delete api_v1_library_url(@api_v1_library), as: :json
    end

    assert_response 204
  end
end
