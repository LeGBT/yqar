require 'test_helper'

class RepSourcesControllerTest < ActionController::TestCase
  setup do
    @rep_source = rep_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rep_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rep_source" do
    assert_difference('RepSource.count') do
      post :create, :rep_source => @rep_source.attributes
    end

    assert_redirected_to rep_source_path(assigns(:rep_source))
  end

  test "should show rep_source" do
    get :show, :id => @rep_source.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rep_source.to_param
    assert_response :success
  end

  test "should update rep_source" do
    put :update, :id => @rep_source.to_param, :rep_source => @rep_source.attributes
    assert_redirected_to rep_source_path(assigns(:rep_source))
  end

  test "should destroy rep_source" do
    assert_difference('RepSource.count', -1) do
      delete :destroy, :id => @rep_source.to_param
    end

    assert_redirected_to rep_sources_path
  end
end
