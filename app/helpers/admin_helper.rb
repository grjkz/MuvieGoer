module AdminHelper
	def admin_auth
		unless logged_in? && is_admin?
			redirect_to root_path
		end
	end

	def is_admin?
		@user = User.find(session[:user_id])
		@user.admin
	end
end
