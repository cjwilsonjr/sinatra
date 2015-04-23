class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs do |t|
      t.belongs_to :song
      t.belongs_to :contributor
      t.integer :track_number
      t.timestamps
    end
  end
end
