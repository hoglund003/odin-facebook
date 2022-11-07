class Relationship < ApplicationRecord
  belongs_to :profile
  belongs_to :partner, class_name: "Profile", required: false
end
