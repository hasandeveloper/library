require 'test_helper'

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_order = api_v1_orders(:one)
  end

  test "should get index" do
    get api_v1_orders_url, as: :json
    assert_response :success
  end

  test "should create api_v1_order" do
    assert_difference('Api::V1::Order.count') do
      post api_v1_orders_url, params: { api_v1_order: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_order" do
    get api_v1_order_url(@api_v1_order), as: :json
    assert_response :success
  end

  test "should update api_v1_order" do
    patch api_v1_order_url(@api_v1_order), params: { api_v1_order: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_order" do
    assert_difference('Api::V1::Order.count', -1) do
      delete api_v1_order_url(@api_v1_order), as: :json
    end

    assert_response 204
  end
end
