class AddAttachmentFileToDataFiles < ActiveRecord::Migration
  def self.up
    change_table :data_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :data_files, :file
  end
end
