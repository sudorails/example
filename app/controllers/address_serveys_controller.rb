class AddressServeysController < ApplicationController
	before_action :set_address_servey, only: [:show, :edit, :update, :destroy, :tab_user]
	before_action :authenticate_user!
	load_and_authorize_resource

	respond_to :html

	def new
		@address_servey = AddressServey.new
	end

	def create
		@customer = Customer.friendly.find(params[:id])
		@servey = AddressServey.new(address_servey_params)
	  @servey.save
    @servey.update_attributes(:date_of_visit => Time.now, 
    													:tab_id => current_user.tab.id, 
    													:user_id => current_user.id, 
    													:customer_id => @customer.id)
		#@customer.review! 
		respond_with(@customer)
	end

  private
  def set_address_servey
    @tab = AddressServey.find(params[:id])
  end

  def address_servey_params
    params.require(:address_servey).permit(:address_confirmed, :marital_status, :user_id, :tab_id, :date_of_visit, :person_contacted, :customer_id, :agency_name, :accept_or_decline, :martial_status)
  end 
end
