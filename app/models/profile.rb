class Profile < ApplicationRecord
  belongs_to :user
  has_one :biography, dependent: :destroy
  has_one :profile_town, dependent: :destroy
  has_one :town, through: :profile_town
  has_one :job, dependent: :destroy
  has_one :relationship, dependent: :destroy

  accepts_nested_attributes_for :user, :biography, :town, :job, :relationship

  def full_name
    "#{first_name} #{last_name}"
  end
end
