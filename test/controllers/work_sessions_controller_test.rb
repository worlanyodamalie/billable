require 'test_helper'

class WorkSessionsControllerTest < ActionController::TestCase
  setup do
    @work_session = work_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_session" do
    assert_difference('WorkSession.count') do
      post :create, work_session: { end: @work_session.end, project_id: @work_session.project_id, start: @work_session.start }
    end

    assert_redirected_to work_session_path(assigns(:work_session))
  end

  test "should show work_session" do
    get :show, id: @work_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_session
    assert_response :success
  end

  test "should update work_session" do
    patch :update, id: @work_session, work_session: { end: @work_session.end, project_id: @work_session.project_id, start: @work_session.start }
    assert_redirected_to work_session_path(assigns(:work_session))
  end

  test "should destroy work_session" do
    assert_difference('WorkSession.count', -1) do
      delete :destroy, id: @work_session
    end

    assert_redirected_to work_sessions_path
  end
end
