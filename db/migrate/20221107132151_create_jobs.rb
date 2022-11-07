class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :profile
      t.text :title
      t.text :company

      t.timestamps
    end
  end
end
