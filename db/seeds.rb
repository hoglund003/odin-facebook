User.delete_all

password = "Admin:123"
admin = User.create!(email: "admin@local", password: password)
Profile.create!(user: admin, first_name: "Admin", last_name: "Boss")
10.times do 
  email = Faker::Internet.safe_email
  user = User.create!(email: email, password: password)
  Profile.create!(user: user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end