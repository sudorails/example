class EducationVerificationsController < ApplicationController
  before_action :set_education_verification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @education_verifications = EducationVerification.all
    respond_with(@education_verifications)
  end

  def show
    respond_with(@education_verification)
  end

  def new
    @education_verification = EducationVerification.new
    respond_with(@education_verification)
  end

  def edit
  end

  def create
    @education_verification = EducationVerification.new(education_verification_params)
    @education_verification.save
    respond_with(@education_verification)
  end

  def update
    @education_verification.update(education_verification_params)
    respond_with(@education_verification)
  end

  def destroy
    @education_verification.destroy
    respond_with(@education_verification)
  end

  private
    def set_education_verification
      @education_verification = EducationVerification.find(params[:id])
    end

    def education_verification_params
      params.require(:education_verification).permit(:stream, :month, :year, :customer_id, :status, :seat_number)
    end
end
