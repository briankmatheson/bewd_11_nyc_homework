class ChangeHashToShortUrl < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.rename :hash, :short_url
    end
  end
end
