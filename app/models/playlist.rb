class Playlist < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :track_listings
  has_many :songs, through: :track_listings
  has_many :contributors, through: :track_listings


end
