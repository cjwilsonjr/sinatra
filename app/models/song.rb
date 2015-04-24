class Song < ActiveRecord::Base
  has_many :track_listings
  has_many :playlists, through: :track_listings


  def self.scrape_tinysongs(user_query)
  songs = Tinysong::Search.all(user_query)
		songs.map! do |song|
			Song.new(title: song.title, artist: song.artist, href: song.href)
		#   song.artist 
		#   song.title  
		#   song.href
		end
		return songs
	end
  # Remember to create a migration!
end
