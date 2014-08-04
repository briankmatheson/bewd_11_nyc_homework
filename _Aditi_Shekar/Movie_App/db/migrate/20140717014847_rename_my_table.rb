class RenameMyTable < ActiveRecord::Migration
  def self.up
    rename_table :title, :movie
  end
  end
end
