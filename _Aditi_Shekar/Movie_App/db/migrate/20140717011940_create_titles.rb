class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :description
      t.integer :year_released

      t.timestamps
    end
  end
end
