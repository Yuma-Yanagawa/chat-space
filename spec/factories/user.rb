FactoryGirl.define do

  factory :user do
    id                 11
    email              { Faker::Internet.email }
    password           { Faker::Number.number(6) }
    name               { Faker::Name.name }

    after(:create) do |user|
      create(:groups_user, user: user, group: create(:group))
    end
  end
end
