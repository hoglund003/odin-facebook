class Profile < ApplicationRecord
  belongs_to :user
  has_one :biography
  has_one :profile_town
  has_one :town, through: :profile_town
  has_one :job
  has_one :relationship

  accepts_nested_attributes_for :user, :biography, :town, :job, :relationship

  def full_name
    "#{first_name} #{last_name}"
  end
end
