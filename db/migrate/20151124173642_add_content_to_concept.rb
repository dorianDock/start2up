class AddContentToConcept < ActiveRecord::Migration
  def change
    add_column :concepts, :content, :string
  end
end
