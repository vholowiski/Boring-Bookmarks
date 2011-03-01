require 'test_helper'

class MymarksControllerTest < ActionController::TestCase
  setup do
    @mymark = mymarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mymarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mymark" do
    assert_difference('Mymark.count') do
      post :create, :mymark => @mymark.attributes
    end

    assert_redirected_to mymark_path(assigns(:mymark))
  end

  test "should show mymark" do
    get :show, :id => @mymark.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mymark.to_param
    assert_response :success
  end

  test "should update mymark" do
    put :update, :id => @mymark.to_param, :mymark => @mymark.attributes
    assert_redirected_to mymark_path(assigns(:mymark))
  end

  test "should destroy mymark" do
    assert_difference('Mymark.count', -1) do
      delete :destroy, :id => @mymark.to_param
    end

    assert_redirected_to mymarks_path
  end
end
