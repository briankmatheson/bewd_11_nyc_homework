class AddCurrentStationToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_station, :integer
  end
end
