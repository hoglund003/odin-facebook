class CreateProfileTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_towns do |t|
      t.belongs_to :profile
      t.belongs_to :town

      t.timestamps
    end
  end
end
