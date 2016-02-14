class CreateUsefulLinkCategories < ActiveRecord::Migration
  def change
    create_table :useful_link_categories do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
