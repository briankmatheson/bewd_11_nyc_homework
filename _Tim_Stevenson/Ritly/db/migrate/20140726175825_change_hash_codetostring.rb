class ChangeHashCodetostring < ActiveRecord::Migration
  def change
  	change_column :urls, :hash_code, :string
  end
end
