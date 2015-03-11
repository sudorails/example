VerificationType.create([{ name: 'Address' }, { name: 'Education' }, { name: 'Crime' }])

tabs = Tab.create([{ name: 'Tab-andheri', tab_code: 'TAB-1'},{ name: 'Tab-malad', tab_code: 'TAB-2'},{ name: 'Tab-thane', tab_code: 'TAB-3'},{ name: 'Tab-matunga', tab_code: 'TAB-4'},{ name: 'Tab-parel', tab_code: 'TAB-5'}])

['tab', 'banned', 'moderator', 'admin'].each do |role|
	Role.find_or_create_by({name: role})
end

user = User.create(:email => "sudhirsb2003@gmail.com", :password => "sudhirsb")
user.confirm!
role = Role.find_by_name('admin')
user.role = role
user.save!

user2 = User.create(email: "yogesh.tiwari@test.com", password: "sudhirsb")
user2.confirm!
role = Role.find_by_name('tab')
user2.role = role
user2.tab = Tab.all.sample
user2.save!

