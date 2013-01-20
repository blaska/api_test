require 'test_helper'

class Api::JavascriptsControllerTest < ActionController::TestCase
  setup do
    @api_javascript = api_javascripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_javascripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_javascript" do
    assert_difference('Api::Javascript.count') do
      post :create, api_javascript: { body: @api_javascript.body, name: @api_javascript.name }
    end

    assert_redirected_to api_javascript_path(assigns(:api_javascript))
  end

  test "should show api_javascript" do
    get :show, id: @api_javascript
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_javascript
    assert_response :success
  end

  test "should update api_javascript" do
    put :update, id: @api_javascript, api_javascript: { body: @api_javascript.body, name: @api_javascript.name }
    assert_redirected_to api_javascript_path(assigns(:api_javascript))
  end

  test "should destroy api_javascript" do
    assert_difference('Api::Javascript.count', -1) do
      delete :destroy, id: @api_javascript
    end

    assert_redirected_to api_javascripts_path
  end
end
