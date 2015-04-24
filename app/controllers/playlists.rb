get "/playlists" do
  @playlists = Playlist.last(20)
  #we need a way to pre-load or eager load all creators and contributors which i can't figure out right now: http://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html
  @playlists.map!{|playlist| [playlist, User.find(playlist.creator_id)]}
  puts @playlists
  @contributors = "Their good friends"
  erb :"playlists/index"
end

get "/playlists/:id/search" do
  erb :"songs/_search_result"
end

post "/playlists/:id/search" do
  search = params[:search]
  if request.xhr?
    @results = Song.scrape_tinysongs(search)

  else
    redirect "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCYQtwIwAQ&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DoHg5SJYRHA0&ei=Fog6VfyyDcHdoAS4gYGoAQ&usg=AFQjCNEcy3X8QxEz3ZqmxAznmt4YfNijBQ&sig2=ZB0QuWl7rZdxj9ge8siM8A&bvm=bv.91427555,bs.1,d.b2w"
  end
end