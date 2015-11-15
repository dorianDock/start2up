class CreateConceptCategories < ActiveRecord::Migration
  def change
    create_table :concept_categories do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
