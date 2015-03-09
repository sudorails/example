module ApplicationHelper
	def pending_on_all_tab
		CustomerVerification.joins(:customer, :tab).where('customers.status' => 'pending', 'tabs.id' => current_user.tab).count
	end
end
