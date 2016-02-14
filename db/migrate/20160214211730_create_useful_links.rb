class CreateUsefulLinks < ActiveRecord::Migration
  def change
    create_table :useful_links do |t|
      t.string :title
      t.string :description
      t.integer :useful_link_category_id

      t.timestamps null: false
    end
  end
end
