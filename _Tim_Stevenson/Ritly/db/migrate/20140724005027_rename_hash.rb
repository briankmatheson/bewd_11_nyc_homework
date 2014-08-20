class RenameHash < ActiveRecord::Migration
  def change
  	rename_column :urls, :hash, :hash_code
  	remove_column :urls, :code
  end
end
