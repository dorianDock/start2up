class CreateLinkComments < ActiveRecord::Migration
  def change
    create_table :link_comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end
  end
end