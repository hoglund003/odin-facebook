class CreateBiographies < ActiveRecord::Migration[7.0]
  def change
    create_table :biographies do |t|
      t.belongs_to :profile
      t.text :body

      t.timestamps
    end
  end
end
