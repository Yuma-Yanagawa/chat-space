FactoryGirl.define do

  factory :groups_user do
    id         1
    group_id   1
    user_id    1
    # created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    # updated_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
