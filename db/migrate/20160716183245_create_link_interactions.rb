class CreateLinkInteractions < ActiveRecord::Migration
  def change
    create_table :link_interactions do |t|
      t.integer :interaction_type_id
      t.integer :user_id
      t.integer :useful_link_id

      t.timestamps null: false
    end
  end
end
