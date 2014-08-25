class AddCurrentPlaylistToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_playlist, :integer
  end
end
