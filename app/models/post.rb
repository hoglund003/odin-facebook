class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments
  belongs_to :user
end
