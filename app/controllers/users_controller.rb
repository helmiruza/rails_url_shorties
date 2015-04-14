
class UsersController < ApplicationController
	
	def signup
		@user = User.new
	end

	def post_signup

		# u = User.find_by(email: params[:user][:email])
		# if u.nil?
			@user = User.create(user_params)
			redirect_to :login
			# @user.save
			# redirect to '/login'
		# else
		# 	@errors = ["Email is already in the system. Try another email"]
		# 	# @errors = @user.errors.full_messages
		# end

	end

	def login
		@user = User.new
	end

	def dashboard
		@user = User.find_by_username(session[:username])
		@uri = Uri.new
		@uris = @user.uris
	end

	def post_login
		@user = User.authenticate(user_params[:username], user_params[:password])	
	 	
	 if @user
	 	session[:username] = @user.username
	 	redirect_to dashboard_path
	 else
	 # 	@errors = ["Authentication failed. Try again"]
	 	redirect_to :login
	 end
	end

	def logout
		session.clear
		redirect_to "/"
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :username)
	end

end
