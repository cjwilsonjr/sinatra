class AddHrefToSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :href
    end
  end
end
