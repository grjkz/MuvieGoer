module ApplicationHelper
	# returns true if user is logged in
	def logged_in?
		@user = User.exists?(session[:user_id])
	end

	# redirects user to signin_path if not signed in
  def logged_in_user
    unless logged_in?
      redirect_to signin_path
    end
  end

  # returns true if no session
  def logged_out?
    session[:user_id] ? false : true
  end

  # redirects user to "/" if logged in
  def logged_out_user
    unless logged_out?
      redirect_to root_path
    end
  end

  def averageRating(movie)
  	avg = movie.reviews.average(:rating)
    avg == nil ? "-" : avg.round(1)
  end
end
