class CreateConceptCategoryLinks < ActiveRecord::Migration
  def change
    create_table :concept_category_links do |t|
      t.integer :concept_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
