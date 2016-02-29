class AddingIsPublicToUsefulLinks < ActiveRecord::Migration
  def change
    add_column :useful_links, :is_public, :boolean, default: false, null: false
  end
end
