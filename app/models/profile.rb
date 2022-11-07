class Profile < ApplicationRecord
  belongs_to :user
  has_one :biography
  has_one :profile_town
  has_one :town, through: :profile_town
  has_many :jobs

  def full_name
    "#{first_name} #{last_name}"
  end
end
