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
end
