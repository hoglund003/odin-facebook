class Friendship < ApplicationRecord
  validates :user, uniqueness: { scope: :friend }
  validate :friend_self

  belongs_to :user
  belongs_to :friend, class_name: "User"

  def friend_self
    errors.add(:friend) if friend_id == user_id
  end
end
