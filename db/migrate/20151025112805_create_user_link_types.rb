class CreateUserLinkTypes < ActiveRecord::Migration
  def change
    create_table :user_link_types do |t|
      t.string :title
    end
  end
end
