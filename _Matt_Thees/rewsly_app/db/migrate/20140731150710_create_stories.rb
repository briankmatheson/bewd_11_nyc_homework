class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.text :link
      t.integer :upvotes
      t.string :category

      t.timestamps
    end
  end
end
