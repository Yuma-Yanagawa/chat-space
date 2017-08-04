FactoryGirl.define do

  factory :user do
    id                 1
    email              "test_mail1@test.com"
    password           12345678
    name               "test_user1"
  end
end
