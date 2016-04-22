class SessionsController < ApplicationController
	def new
		@user = User.new
	end

  def create
  	@user = User.find_by("lower(alias) = ?", params[:alias])
  	if (@user && @user.authenticate(params[:password]))
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Invalid Username/Password"
  		redirect_to login_path
  	end
  end

  def destroy
  
  end

  private
  def user_params
  	params.require(:user).permit(:alias, :password)
  end
end
