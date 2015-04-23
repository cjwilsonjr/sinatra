class TrackListing < ActiveRecord::Base
  belongs_to :contributor, class_name: "User"
  belongs_to :song
  belongs_to :playlist
  # Remember to create a migration!
end
