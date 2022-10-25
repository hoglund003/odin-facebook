User.delete_all

password = "Admin:123"
User.create!(email: "admin@local", password: password)
10.times do 
  email = Faker::Internet.safe_email
  User.create!(email: email, password: password)
end