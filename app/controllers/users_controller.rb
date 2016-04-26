class UsersController < ApplicationController

	before_action :logged_out_user

	# form for /signup
	def new
		@user = User.new
	end

	# create new user
	def create
		@user = User.create(user_params)
		
		if @user.save
			# send welcome email to user
			UserMailer.welcome_email(@user).deliver

			session[:user_id] = @user.id
			redirect_to root_path
		else #user already exists
			flash[:error] = @user.errors.full_messages
			redirect_to new_user_path
		end
		
	end


	private

	def user_params
		params.require(:user).permit(:alias, :email, :password, :password_confirmation)
	end


end
