require 'test_helper'

class EditorPicksControllerTest < ActionController::TestCase
  setup do
    @editor_pick = editor_picks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editor_picks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editor_pick" do
    assert_difference('EditorPick.count') do
      post :create, editor_pick: { description: @editor_pick.description, image: @editor_pick.image, name: @editor_pick.name, onTop: @editor_pick.onTop }
    end

    assert_redirected_to editor_pick_path(assigns(:editor_pick))
  end

  test "should show editor_pick" do
    get :show, id: @editor_pick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editor_pick
    assert_response :success
  end

  test "should update editor_pick" do
    patch :update, id: @editor_pick, editor_pick: { description: @editor_pick.description, image: @editor_pick.image, name: @editor_pick.name, onTop: @editor_pick.onTop }
    assert_redirected_to editor_pick_path(assigns(:editor_pick))
  end

  test "should destroy editor_pick" do
    assert_difference('EditorPick.count', -1) do
      delete :destroy, id: @editor_pick
    end

    assert_redirected_to editor_picks_path
  end
end
