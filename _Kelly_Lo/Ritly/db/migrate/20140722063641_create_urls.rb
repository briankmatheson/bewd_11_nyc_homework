class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.string :hash_code
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
