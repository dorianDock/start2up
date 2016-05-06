class AddUrlToUsefulLink < ActiveRecord::Migration
  def change
    add_column :useful_links, :url, :string
  end
end
