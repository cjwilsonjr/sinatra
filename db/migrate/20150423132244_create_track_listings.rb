class CreateTrackListings < ActiveRecord::Migration
  def change
    create_table :track_listings do |t|
      t.belongs_to :song
      t.belongs_to :contributor
      t.belongs_to :playlist
      t.timestamps
    end
  end
end
