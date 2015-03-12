class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :customer_verification]
  load_and_authorize_resource
  respond_to :html


  def index
    @customers = Customer.order("id ASC")
    respond_with(@customers)
  end

  def show
    respond_with(@customer)
  end

  def new
    @customer = Customer.new    
    @reference_id = Customer.any? ? Customer.last.reference_id+1 : 1001 
    @customer.build_address_verification
    @customer.build_education_verification
    @customer.build_crime_verification
    @customer.customer_documents.build
    respond_with(@customer)
  end

  def edit
  end

  def user_list
    @users = User.order('id DESC')
  end

  def tab_approve
    @user = User.find(params[:user_id])
    @user.confirm!
    redirect_to users_path, :notice => "congratulations! user is successfully Confirmed"
  end

  def customer_verification
    @customer_verification = CustomerVerification.create(customer_id: @customer.id, tab_id: params[:customer_verification][:tab_id].to_i, user_id: current_user.id)
    if @customer_verification.save
     @customer_verification.customer.submit!
     flash[:notice] = "successfully saved" 
   end
    respond_with(@customer)
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    @customer.request_id = Customer.present? ? @customer.reference_id : 1001
    @customer.save
    if current_user.tab?
      redirect_to root_url , :notice => "Customer Created Successfully"
    elsif current_user.admin? 
      respond_with(@customer)
    end
  end

  def update
    @customer.update(customer_params)
    @customer.submit!
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  private
    def set_customer
      @customer = Customer.friendly.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :verified, :verification_type_id, :status, :reference_id, :user_id, :father_name, :dob, :location, :customer_id, :address, 
      customer_documents_attributes: [ :customer_id, :doc_name, :document ])

      #address_verification_attributes: [ :father_name, :dob, :location, :customer_id, :address_one, :address_two, :address_third ],
      #education_verification_attributes: [ :seat_number, :stream, :month, :year, :customer_id, :status ],
      #crime_verification_attributes: [ :father_name, :dob, :location, :customer_id, :address_one, :address_two, :address_third ])      
    end
end
