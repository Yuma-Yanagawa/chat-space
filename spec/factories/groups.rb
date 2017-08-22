FactoryGirl.define do

  factory :group do
    name       { Faker::Lorem.word }
    id         11
  end
end
