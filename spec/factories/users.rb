FactoryGirl.define do

  factory :user do
    id                 1
    email              "test_mail1@test.com"
    password           12345678
    name               "test_user1"
    # current_sign_in_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    # last_sign_in_at    {Faker::Time.between(2.days.ago, Time.now, :all)}
    # current_sign_in_ip  {Faker::Time.between(2.days.ago, Time.now, :all)}
    # last_sign_in_ip    {Faker::Time.between(2.days.ago, Time.now, :all)}
    # created_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
    # updated_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
