class CreateTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :towns do |t|
      t.text :name
      t.text :country

      t.timestamps
    end
  end
end
