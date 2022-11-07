class ProfileTown < ApplicationRecord
  belongs_to :profile
  belongs_to :town
end
