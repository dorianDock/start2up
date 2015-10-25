class CreateUserLinks < ActiveRecord::Migration
  def change
    create_table :user_links do |t|
      t.integer :askerId
      t.integer :answererId
      t.integer :user_link_type_id
      t.boolean :isAccepted

      t.timestamps null: false
    end
  end
end
