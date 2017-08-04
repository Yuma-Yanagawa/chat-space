FactoryGirl.define do

  factory :user do
    id                 { Faker::Number.digit }
    email              { Faker::Internet.email }
    password           { Faker::Number.digit }
    name               { Faker::Name.name }

    after(:create) do |user|
      create(:group_user, user: user, group: create(:group))
    end
  end
end
