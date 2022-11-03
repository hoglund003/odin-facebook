User.delete_all
Profile.delete_all
FriendRequest.delete_all
Friendship.delete_all
Post.delete_all

password = "Admin:123"
admin = User.create!(email: "admin@local", password: password)
Profile.create!(user: admin, first_name: "Admin", last_name: "Boss")
10.times do 
  email = Faker::Internet.safe_email
  user = User.create!(email: email, password: password)
  Profile.create!(user: user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

User.all.each do |user|
  2.times do
    title = Faker::Lorem.sentence
    body = Faker::Lorem.paragraph
    user.posts.create!(title: title, body: body)
  end
end