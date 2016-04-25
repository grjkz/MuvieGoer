class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	# user is logging on; create session cookie
  def create
  	@user = User.find_by("lower(alias) = ?", user_params[:alias])
  	
  	if (@user && @user.authenticate(user_params[:password]))
  		session[:admin] = @user.admin
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Invalid Username/Password"
  		redirect_to signin_path
  	end
  end

  def destroy
  	reset_session
  	redirect_to signin_path
  end

  private
  def user_params
  	params.require(:user).permit(:alias, :password)
  end
end
