class HomeController < ApplicationController
  include ApplicationHelper

	def index
		@tabs = Tab.order('id ASC')
		@customer_verifications = Customer.all
		@pending_on_tabs = current_user.customers
	end

	def list_tab_users
		@tabs = Tab.order("id Desc")
	end
end
