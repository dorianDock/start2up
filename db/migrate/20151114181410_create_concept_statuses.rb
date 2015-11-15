class CreateConceptStatuses < ActiveRecord::Migration
  def change
    create_table :concept_statuses do |t|

      t.timestamps null: false
    end
  end
end
