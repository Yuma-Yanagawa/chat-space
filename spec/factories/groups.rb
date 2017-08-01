FactoryGirl.define do

  factory :group do
    id         1
    name       "test_group1"
    # created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    # updated_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
