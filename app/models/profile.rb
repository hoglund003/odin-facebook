class Profile < ApplicationRecord
  belongs_to :user
  has_one :biography

  def full_name
    "#{first_name} #{last_name}"
  end
end
