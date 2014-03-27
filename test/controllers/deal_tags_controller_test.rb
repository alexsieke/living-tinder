require 'test_helper'

class DealTagsControllerTest < ActionController::TestCase
  setup do
    @deal_tag = deal_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_tag" do
    assert_difference('DealTag.count') do
      post :create, deal_tag: { deal_id: @deal_tag.deal_id, tag_id: @deal_tag.tag_id }
    end

    assert_redirected_to deal_tag_path(assigns(:deal_tag))
  end

  test "should show deal_tag" do
    get :show, id: @deal_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal_tag
    assert_response :success
  end

  test "should update deal_tag" do
    patch :update, id: @deal_tag, deal_tag: { deal_id: @deal_tag.deal_id, tag_id: @deal_tag.tag_id }
    assert_redirected_to deal_tag_path(assigns(:deal_tag))
  end

  test "should destroy deal_tag" do
    assert_difference('DealTag.count', -1) do
      delete :destroy, id: @deal_tag
    end

    assert_redirected_to deal_tags_path
  end
end
