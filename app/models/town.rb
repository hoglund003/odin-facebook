class Town < ApplicationRecord
  has_many :profile_towns
  has_many :profiles, through: :profile_towns
end
