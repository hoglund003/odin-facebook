class Friendship < ApplicationRecord
  validates :user, uniqueness: { scope: :friend }

  belongs_to :user
  belongs_to :friend, class_name: "User"
end
