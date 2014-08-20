class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album
      t.string :artist
      t.string :album_artist
      t.string :data_url
      t.integer :user_id

      t.timestamps
    end
  end
end
