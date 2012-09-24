FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :activity do
    name "Lake Merced Loop"
    distance 6
    time 42
    user
  end

  factory :feed_entry do
    guid "http://sportsdoc.runnersworld.com/2012/09/how-can-i-overcome-persistent-asthma.html"
    name "Ask the Sports Doc"
    published_at Time.now
    summary "My question is ?"
    url "http://www.google.com"
  end


end