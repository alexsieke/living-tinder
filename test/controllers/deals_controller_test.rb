require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, deal: { city_name: @deal.city_name, deal_id: @deal.deal_id, description: @deal.description, dma: @deal.dma, feature_price: @deal.feature_price, feature_value: @deal.feature_value, image_url: @deal.image_url, len: @deal.len, ls_pct: @deal.ls_pct, merchant_name: @deal.merchant_name, offer_ends_at: @deal.offer_ends_at, offer_starts_at: @deal.offer_starts_at, sales_rep: @deal.sales_rep, short_title: @deal.short_title }
    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: @deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal
    assert_response :success
  end

  test "should update deal" do
    patch :update, id: @deal, deal: { city_name: @deal.city_name, deal_id: @deal.deal_id, description: @deal.description, dma: @deal.dma, feature_price: @deal.feature_price, feature_value: @deal.feature_value, image_url: @deal.image_url, len: @deal.len, ls_pct: @deal.ls_pct, merchant_name: @deal.merchant_name, offer_ends_at: @deal.offer_ends_at, offer_starts_at: @deal.offer_starts_at, sales_rep: @deal.sales_rep, short_title: @deal.short_title }
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, id: @deal
    end

    assert_redirected_to deals_path
  end
end
