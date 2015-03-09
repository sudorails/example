require 'test_helper'

class EducationVerificationsControllerTest < ActionController::TestCase
  setup do
    @education_verification = education_verifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:education_verifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create education_verification" do
    assert_difference('EducationVerification.count') do
      post :create, education_verification: { customer_id: @education_verification.customer_id, month: @education_verification.month, status: @education_verification.status, stream: @education_verification.stream, year: @education_verification.year }
    end

    assert_redirected_to education_verification_path(assigns(:education_verification))
  end

  test "should show education_verification" do
    get :show, id: @education_verification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education_verification
    assert_response :success
  end

  test "should update education_verification" do
    patch :update, id: @education_verification, education_verification: { customer_id: @education_verification.customer_id, month: @education_verification.month, status: @education_verification.status, stream: @education_verification.stream, year: @education_verification.year }
    assert_redirected_to education_verification_path(assigns(:education_verification))
  end

  test "should destroy education_verification" do
    assert_difference('EducationVerification.count', -1) do
      delete :destroy, id: @education_verification
    end

    assert_redirected_to education_verifications_path
  end
end
