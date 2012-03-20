require 'test_helper'

class EvaluationStucturesControllerTest < ActionController::TestCase
  setup do
    @evaluation_structure = evaluation_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_structure" do
    assert_difference('EvaluationStucture.count') do
      post :create, :evaluation_structure => @evaluation_structure.attributes
    end

    assert_redirected_to evaluation_structure_path(assigns(:evaluation_structure))
  end

  test "should show evaluation_structure" do
    get :show, :id => @evaluation_structure.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @evaluation_structure.to_param
    assert_response :success
  end

  test "should update evaluation_structure" do
    put :update, :id => @evaluation_structure.to_param, :evaluation_structure => @evaluation_structure.attributes
    assert_redirected_to evaluation_structure_path(assigns(:evaluation_structure))
  end

  test "should destroy evaluation_structure" do
    assert_difference('EvaluationStucture.count', -1) do
      delete :destroy, :id => @evaluation_structure.to_param
    end

    assert_redirected_to evaluation_structures_path
  end
end
