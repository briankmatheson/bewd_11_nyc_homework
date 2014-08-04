class CreateModelNames < ActiveRecord::Migration
  def change
    create_table :model_names do |t|
      t.string :title
      t.string :description
      t.string :year_released

      t.timestamps
    end
  end
end
