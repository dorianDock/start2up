class AddAttachmentPictureToUsefulLinks < ActiveRecord::Migration
  def self.up
    change_table :useful_links do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :useful_links, :picture
  end
end
