class ChangeHashcodeFormat < ActiveRecord::Migration
  def change
  	change_column :urls, :hash, :integer
  end
end
