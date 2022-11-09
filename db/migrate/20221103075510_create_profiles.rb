class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text :first_name
      t.text :last_name
      t.date :birthday

      t.timestamps
    end
  end
end
