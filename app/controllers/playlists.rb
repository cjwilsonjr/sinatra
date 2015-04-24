get "/playlists" do
  @playlists = Playlist.last(20)
  #we need a way to pre-load or eager load all creators and contributors which i can't figure out right now: http://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html
  @playlists.map!{|playlist| [playlist, User.find(playlist.creator_id)]}
  puts @playlists
  @contributors = "Their good friends"
  erb :"playlists/index"
end
