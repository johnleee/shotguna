namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_activities
  end
end

def make_users
  admin = User.create!(name:     "John Lee",
                       email:    "john.lee@sv.cmu.edu",
                       password: "foobar1",
                       password_confirmation: "foobar1")
  admin.toggle!(:admin)
  User.create!(name:     "Netwon Run",
               email:    "dabuda@gmail.com",
               password: "foobar1",
               password_confirmation: "foobar1")
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_activities
  users = User.all(limit: 4)
  10.times do
    name = "Lake Merced Loop"
    distance = 6
    date = Time.now
    time = 54
    address = { city: "San Francisco", state: "CA", zip: "94132"}
    users.each { |user| user.activities.create!(name: name,
        distance: distance, date: date, time: time, address_attributes: address) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end