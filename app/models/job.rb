class Job < ApplicationRecord
  belongs_to :profile

  validates :title, length: { minimum: 1, maximum: 40 }
  validates :company, length: { minimum: 1, maximum: 40 }
end
