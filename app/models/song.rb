class Song < ActiveRecord::Base
  has_many :track_listings
  has_many :playlists, through: :track_listings


  def scrape_tinysongs(user_query)
  songs = Tinysong::Search.all(user_query)
		songs.each do |song|
		  song.artist 
		  song.title  
		  song.href
		end
	end
  # Remember to create a migration!
end
