class FixColHashBorkage < ActiveRecord::Migration
  def change
    rename_column :users, :hash, :pw_hash
  end
end
