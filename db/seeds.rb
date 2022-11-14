User.delete_all
Profile.delete_all
FriendRequest.delete_all
Friendship.delete_all
Post.delete_all
Like.delete_all
Comment.delete_all
Biography.delete_all
Town.delete_all
ProfileTown.delete_all
Job.delete_all

countries = ["Norway"]
towns = ["Skien", "Oslo", "Drammen"]

relationship_statuses = ["Married to", "In a relationship with", "Single"]

password = "Admin:123"
admin = User.create!(email: "admin@local", password: password)
birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
Profile.create!(user: admin, first_name: "Admin", last_name: "Boss", birthday: birthday)
10.times do 
  email = Faker::Internet.safe_email
  user = User.create!(email: email, password: password)
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  Profile.create!(user: user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthday: birthday)
end

towns.each do |town|
  Town.create!(name: town, country: countries[0])
end

Profile.all.each do |profile|
  ProfileTown.create!(profile: profile, town: Town.all.sample)
end

Profile.all.each do |profile|
  Job.create!(profile: profile, title: Faker::Job.title, company: Faker::Company.name)

  relationship_status = relationship_statuses.sample
  if relationship_status == "Single"
    partner = nil
  else
    partner = Profile.all.sample
  end

  Relationship.create!(profile: profile, status: relationship_status, partner: partner)
end

User.all.each do |user|
  2.times do
    title = Faker::Lorem.sentence
    body = Faker::Lorem.paragraph
    user.posts.create!(title: title, body: body)
  end

  5.times do
    friend = User.all.sample
    begin
      Friendship.create!(user: user, friend: friend)
      Friendship.create!(user: friend, friend: user)
    rescue
      puts 'I am rescued.'
    end
  end

  Biography.create!(body: Faker::Lorem.paragraph, profile: user.profile)
end

Post.all.each do |post|
  5.times do
    body = Faker::Lorem.sentence
    post.comments.create!(body: body, user: User.all.sample)
  end
end