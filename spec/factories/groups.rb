FactoryGirl.define do

  factory :group do
    id         1
    name       { Faker::Lorem.word }
  end
end
