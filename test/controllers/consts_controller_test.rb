require 'test_helper'

class ConstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @const = consts(:one)
  end

  test "should get index" do
    get consts_url, as: :json
    assert_response :success
  end

  test "should create const" do
    assert_difference('Const.count') do
      post consts_url, params: { const: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show const" do
    get const_url(@const), as: :json
    assert_response :success
  end

  test "should update const" do
    patch const_url(@const), params: { const: {  } }, as: :json
    assert_response 200
  end

  test "should destroy const" do
    assert_difference('Const.count', -1) do
      delete const_url(@const), as: :json
    end

    assert_response 204
  end
end
