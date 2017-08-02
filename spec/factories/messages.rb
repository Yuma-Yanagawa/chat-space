FactoryGirl.define do

  factory :message do
    id         1
    body       "test_message1"
    image      { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg' }
    group_id   1
    user_id    1
    # created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    # updated_at {Faker::Time.between(2.days.ago, Time.now, :all)}

    # after(:build) do |message|
    #   message.user << FactoryGirl.build(:user, id: message.user_id)
    #   message.group << FactoryGirl.build(:cgroup, id: message.group_id)
    # end
  end

end
