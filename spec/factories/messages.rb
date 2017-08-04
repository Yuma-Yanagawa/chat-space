FactoryGirl.define do

  factory :message do
    id         { Faker::Number.digit }
    body       { Faker::Internet.email }
    image      { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg' }
    group_id   1
    user_id    1
  end

end
