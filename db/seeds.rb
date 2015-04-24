users = 50.times.map do
  User.create!(
                :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

songs = 100.times.map do
  Song.create!( artist:    Faker::Company.name,
                title:     Faker::Lorem.words.join(" "),
                release_date:      Faker::Time.between(2.days.ago, 30.years.ago, :all),
                album:     Faker::Company.bs)
end

50.times do
  Playlist.create!( creator_id: users[rand(users.length)].id,
                    title:      Faker::App.name
                    )
end

Playlist.all.each do |playlist|
  rand(7..12).times do
    playlist.track_listings << TrackListing.create!(song_id:        songs[rand(songs.length)].id,
                                                    contributor_id: users[rand(users.length)].id )
  end

end

