require 'test_helper'

class TindersControllerTest < ActionController::TestCase
  setup do
    @tinder = tinders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tinders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tinder" do
    assert_difference('Tinder.count') do
      post :create, tinder: { loser_id: @tinder.loser_id, winner_id: @tinder.winner_id }
    end

    assert_redirected_to tinder_path(assigns(:tinder))
  end

  test "should show tinder" do
    get :show, id: @tinder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tinder
    assert_response :success
  end

  test "should update tinder" do
    patch :update, id: @tinder, tinder: { loser_id: @tinder.loser_id, winner_id: @tinder.winner_id }
    assert_redirected_to tinder_path(assigns(:tinder))
  end

  test "should destroy tinder" do
    assert_difference('Tinder.count', -1) do
      delete :destroy, id: @tinder
    end

    assert_redirected_to tinders_path
  end
end
