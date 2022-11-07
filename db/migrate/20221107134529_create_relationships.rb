class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :profile
      t.belongs_to :partner, null: true
      t.text :status

      t.timestamps
    end
  end
end
