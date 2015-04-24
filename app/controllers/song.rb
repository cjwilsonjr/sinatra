get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/songs/new" do
  @song = Song.new
  erb :"songs/new"
end

post "/songs" do
  @song = Song.new(params[:song])
  if @song.save
    redirect "/songs/#{@song.id}"
  else
    @errors = @song.errors.full_messages
    erb :"songs/new"
  end
end

get "/songs/:id" do
  @song = Song.find(params[:id])
  erb :"songs/show"
end

get "/songs/:id/edit" do
  @song = Song.find(params[:id])
  erb :"songs/edit"
end

put "/songs/:id" do
  @song = Song.find(params[:id])
  @song.update!(params[:song])
  redirect "/songs/#{params[:id]}"
end

delete "/songs/id" do
  @song = Song.find(params[:id])
  @song.destroy
  redirect "/songs"
end