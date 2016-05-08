class AddAuthorIdToComment < ActiveRecord::Migration
  def change
    add_column :link_comments, :author_id, :integer
  end
end
