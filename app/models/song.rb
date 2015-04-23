class Song < ActiveRecord::Base
  has_many :track_listings
  has_many :playlists, through: :track_listings

  # Remember to create a migration!
end
