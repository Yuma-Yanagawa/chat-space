FactoryGirl.define do

  factory :user do
    id                 { Faker::Number.digit }
    email              { Faker::Internet.email }
    password           { Faker::Number.digit }
    name               "test_user1"
  end
end
