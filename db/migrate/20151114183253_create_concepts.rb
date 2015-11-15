class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :title
      t.integer :associate_number
      t.integer :associate_wished_number
      t.integer :concept_type_id
      t.integer :concept_status_id

      t.timestamps null: false
    end
  end
end
