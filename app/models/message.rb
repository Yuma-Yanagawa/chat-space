class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :body, presence: true, unless: :image?

  def message_cannnot_be_in_the_past
    if body.present? || image.present?
      return true
    else
      return false
    end
  end
end
