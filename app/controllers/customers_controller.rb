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
    @customer.increment!(:reference_id) 
    @customer.user_id = current_user.id
    @customer.save
    respond_with(@customer)
  end

  def update
    @customer.update(customer_params)
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
      params.require(:customer).permit(:name, :verification_type_id, :status, :reference_id, :user_id,  
      address_verification_attributes: [ :father_name, :dob, :location, :customer_id, :address_one, :address_two, :address_third ],
      education_verification_attributes: [ :seat_number, :stream, :month, :year, :customer_id, :status ],
      customer_documents_attributes: [ :customer_id, :document ],
      crime_verification_attributes: [ :father_name, :dob, :location, :customer_id, :address_one, :address_two, :address_third ])      
    end
end
