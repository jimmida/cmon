require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { address: @listing.address, area: @listing.area, body: @listing.body, category: @listing.category, contact_email: @listing.contact_email, contact_method: @listing.contact_method, contact_name: @listing.contact_name, contact_phone: @listing.contact_phone, latitude: @listing.latitude, longitude: @listing.longitude, post_id: @listing.post_id, post_time: @listing.post_time, price: @listing.price, region: @listing.region, subcategory: @listing.subcategory, title: @listing.title, update_time: @listing.update_time }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { address: @listing.address, area: @listing.area, body: @listing.body, category: @listing.category, contact_email: @listing.contact_email, contact_method: @listing.contact_method, contact_name: @listing.contact_name, contact_phone: @listing.contact_phone, latitude: @listing.latitude, longitude: @listing.longitude, post_id: @listing.post_id, post_time: @listing.post_time, price: @listing.price, region: @listing.region, subcategory: @listing.subcategory, title: @listing.title, update_time: @listing.update_time }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
