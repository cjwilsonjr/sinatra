#INDEX
get "/users" do
  @users = User.all
  erb :"/users/index"
end

#NEW
get "/users/new" do
  @user = User.new
  erb :"users/new"
end

#CREATE
post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

#SHOW
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/show"
end

#LOGIN
get "/login" do
  erb :"users/login"
end

post "/login" do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"/users/_new"
  end
end

#LOGOUT
get "/logout" do
  session[:user_id] = nil
  redirect "/"
end