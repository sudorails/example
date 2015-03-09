class AddressVerificationsController < ApplicationController
  before_action :set_address_verification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @address_verifications = AddressVerification.all
    respond_with(@address_verifications)
  end

  def show
    respond_with(@address_verification)
  end

  def new
    @address_verification = AddressVerification.new
    respond_with(@address_verification)
  end

  def edit
  end

  def create
    if params[:customer] && params[:customer][:address_verification_attributes]["father_name"].present?
      @address_verification = AddressVerification.new(address_verification_params)
      @address_verification.save
      @address_verification.customer.review!
    end
    respond_with(@address_verification)
  end

  def update
    @address_verification.update(address_verification_params)
    respond_with(@address_verification)
  end

  def destroy
    @address_verification.destroy
    respond_with(@address_verification)
  end

  private
    def set_address_verification
      @address_verification = AddressVerification.find(params[:id])
    end

    def address_verification_params
      params.require(:address_verification).permit(:father_name, :dob, :location, :address_one, :address_two, :address_third, :customer_id, :status)
    end
end
