class Group < ApplicationRecord
  has_many :users, through: :groups_users
  has_many :messages
  has_many :groups_users

  def puts_messages
    if messages.last.try(:image).present?
      '画像が投稿されています'
    elsif messages.last.try(:body)
      messages.last.try(:body)
    else
      'まだメッセージはありません'
    end
  end
end
