require 'test_helper'

class HitListsControllerTest < ActionController::TestCase
  setup do
    @hit_list = hit_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hit_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hit_list" do
    assert_difference('HitList.count') do
      post :create, hit_list: { filter_id: @hit_list.filter_id, listing_id: @hit_list.listing_id }
    end

    assert_redirected_to hit_list_path(assigns(:hit_list))
  end

  test "should show hit_list" do
    get :show, id: @hit_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hit_list
    assert_response :success
  end

  test "should update hit_list" do
    patch :update, id: @hit_list, hit_list: { filter_id: @hit_list.filter_id, listing_id: @hit_list.listing_id }
    assert_redirected_to hit_list_path(assigns(:hit_list))
  end

  test "should destroy hit_list" do
    assert_difference('HitList.count', -1) do
      delete :destroy, id: @hit_list
    end

    assert_redirected_to hit_lists_path
  end
end
