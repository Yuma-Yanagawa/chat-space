FactoryGirl.define do

  factory :groups_user do
    id         { Faker::Number.digit }
    group_id   1
    user_id    1
  end
end
