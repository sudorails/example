user = User.create(:email => "sudhirsb2003@gmail.com", :password => "sudhirsb")
user.confirm!
role = Role.find_by_name('admin')
user.role = role
user.save!

user2 = User.create(email: "yogesh.tiwari@test.com", password: "sudhirsb")
user2.confirm!
role = Role.find_by_name('tab')
user2.role = role
user2.save!

VerificationType.create([{ name: 'Address' }, { name: 'Education' }, { name: 'Crime' }])

['tab', 'banned', 'moderator', 'admin'].each do |role|
	Role.find_or_create_by({name: role})
end
