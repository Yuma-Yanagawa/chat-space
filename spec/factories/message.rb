FactoryGirl.define do

  factory :message do
    body       { Faker::Lorem.word }
    image      { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg' }
    group
    user
  end

end
