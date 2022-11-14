class Town < ApplicationRecord
  has_many :profile_towns, dependent: :destroy
  has_many :profiles, through: :profile_towns
end
