class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.belongs_to :creator
      t.timestamps
    end
  end
end
