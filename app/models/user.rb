class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :friend_requests, dependent: :destroy

  has_one :profile

  has_many :posts

  has_many :likes
  has_many :comments


  def friend_requests_in
    FriendRequest.where(friend: self)
  end

  def friend_requests_out
    self.friend_requests
  end
end
