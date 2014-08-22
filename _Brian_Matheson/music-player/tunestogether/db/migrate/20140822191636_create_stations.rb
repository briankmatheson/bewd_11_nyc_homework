class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :current_song_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
