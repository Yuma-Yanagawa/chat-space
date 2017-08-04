FactoryGirl.define do

  factory :user do
    id                 { Faker::Number.digit }
    email              { Faker::Internet.email }
    password           12345678
    name               "test_user1"
  end
end
