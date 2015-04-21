#INDEX
get "/renames" do
  @renames = Rename.all
  erb :"renames/index"
end

#NEW
get "/renames/new" do
  @rename = Rename.new
  erb :"renames/new"
end

#CREATE
post "/renames" do
  @rename = Rename.new(params[:rename])
  if @rename.save
    redirect "/renames/#{@rename.id}"
  else
    @errors = @rename.errors.full_messages
  end
end

#SHOW
get "/renames/:id" do
  @rename = Rename.find(params[:id])
  erb :"/renames/show"
end

#EDIT
get "/renames/:id/edit" do
  @rename = Rename.find(params[:id])
  erb :"/renames/edit"
end

#UPDATE
put "/renames/:id" do
  @rename = Rename.find(params[:id])
  @rename.update!(params[:rename])
  redirect "/renames/#{params[:id]}"
end

#DELETE
delete "/renames/:id" do
  @rename = Rename.find(params[:id])
  @rename.destroy
  redirect "/renames"
end