require 'rails_helper'

describe Message do
  describe '#create' do
    # let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg' }
    # let(:image) { Rack::Test::UploadedFile.new(image_path) }

    it "is valid with a body" do
      message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, body: nil)
      message.valid?
      expect(message).to be_valid
    end
    #
    # it "is valid with a body, image" do
    #   message = build(:message)
    #   message.valid?
    #   expect(message).to be_valid
    # end
    #
    # it "is invalid without a body, image" do
    #   message = build(:message, body: "", image: "")
    #   message.valid?
    #   expect(message.errors[:body, :imgae]).to include("can't be blank")
    # end
    #
    # it "is invalid without a group_id" do
    #   message = build(:message, group_id: "")
    #   message.valid?
    #   expect(message.errors[:group_id]).to include("can't be blank")
    # end
    #
    # it "is invalid without a user_id" do
    #   message = create(:message, user_id: "")
    #   message.valid?
    #   expect(message.errors[:user_id]).to include("can't be blank")
    # end
  end

end
