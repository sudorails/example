require 'test_helper'

class AddressVerificationsControllerTest < ActionController::TestCase
  setup do
    @address_verification = address_verifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_verifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_verification" do
    assert_difference('AddressVerification.count') do
      post :create, address_verification: { address_one: @address_verification.address_one, address_third: @address_verification.address_third, address_two: @address_verification.address_two, customer_id: @address_verification.customer_id, dob: @address_verification.dob, father_name: @address_verification.father_name, location: @address_verification.location, status: @address_verification.status }
    end

    assert_redirected_to address_verification_path(assigns(:address_verification))
  end

  test "should show address_verification" do
    get :show, id: @address_verification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address_verification
    assert_response :success
  end

  test "should update address_verification" do
    patch :update, id: @address_verification, address_verification: { address_one: @address_verification.address_one, address_third: @address_verification.address_third, address_two: @address_verification.address_two, customer_id: @address_verification.customer_id, dob: @address_verification.dob, father_name: @address_verification.father_name, location: @address_verification.location, status: @address_verification.status }
    assert_redirected_to address_verification_path(assigns(:address_verification))
  end

  test "should destroy address_verification" do
    assert_difference('AddressVerification.count', -1) do
      delete :destroy, id: @address_verification
    end

    assert_redirected_to address_verifications_path
  end
end
