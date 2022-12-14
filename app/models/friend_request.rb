class FriendRequest < ApplicationRecord
  STATUSES = ["pending", "accepted", "declined"]
  validates_inclusion_of :status, :in => STATUSES, :message => "{{value} must be in #{STATUSES.join ','}"
  validates :user, uniqueness: { scope: :friend }

  belongs_to :user
  belongs_to :friend, class_name: "User"
end
