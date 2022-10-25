class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :user
      t.belongs_to :friend
      t.text :status

      t.timestamps
    end
  end
end
