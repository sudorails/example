class HomeController < ApplicationController
  include ApplicationHelper

	def index
		@tabs = Tab.order('id ASC')
		@customer_verifications = CustomerVerification.all
		@pending_on_tabs = CustomerVerification.joins(:customer, :tab).where('tabs.id =?', current_user.tab)
	end

	def list_tab_users
		@tabs = Tab.order("id Desc")
	end
end
