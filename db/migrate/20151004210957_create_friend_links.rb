class CreateFriendLinks < ActiveRecord::Migration
  def change
    create_table :friend_links do |t|
      t.integer :askerId
      t.integer :answererId

      t.timestamps null: false
    end
  end
end
