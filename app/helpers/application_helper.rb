module ApplicationHelper

	def pending_on_all_tab
		CustomerVerification.joins(:customer, :tab).where('customers.status' => 'pending', 'tabs.id' => current_user.tab).count
	end

  def newly_added_customers_count
  	Customer.where('status=?', 'pending').count
  end
end
