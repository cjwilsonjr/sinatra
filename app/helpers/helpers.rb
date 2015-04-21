helpers do

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # def display_errors()

  # end

  def entry_path(entry)
    "/entries/#{user.id}"
  end

  def entries_path
    "/entries"
  end

end