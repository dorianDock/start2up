class CreateConceptTypes < ActiveRecord::Migration
  def change
    create_table :concept_types do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
