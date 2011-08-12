require 'test_helper'

class BigAuth::UsersControllerTest < ActionController::TestCase
  setup do
    @big_auth_user = big_auth_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:big_auth_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create big_auth_user" do
    assert_difference('BigAuth::User.count') do
      post :create, :big_auth_user => @big_auth_user.attributes
    end

    assert_redirected_to big_auth_user_path(assigns(:big_auth_user))
  end

  test "should show big_auth_user" do
    get :show, :id => @big_auth_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @big_auth_user.to_param
    assert_response :success
  end

  test "should update big_auth_user" do
    put :update, :id => @big_auth_user.to_param, :big_auth_user => @big_auth_user.attributes
    assert_redirected_to big_auth_user_path(assigns(:big_auth_user))
  end

  test "should destroy big_auth_user" do
    assert_difference('BigAuth::User.count', -1) do
      delete :destroy, :id => @big_auth_user.to_param
    end

    assert_redirected_to big_auth_users_path
  end
end
