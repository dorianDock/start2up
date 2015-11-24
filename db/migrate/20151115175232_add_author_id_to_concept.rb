class AddAuthorIdToConcept < ActiveRecord::Migration
  def change
    add_column :concepts, :author_id, :integer
  end
end
