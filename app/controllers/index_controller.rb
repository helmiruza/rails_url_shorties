class IndexController < ApplicationController
	def index
		if session[:username] != nil
			redirect_to dashboard_path
		else
			@uris = Uri.all
			@uri = Uri.new
		end
	end

	def create
		@user = User.find_by_username(session[:username])


		if @user
			@uri = @user.uris.create(uri_params)
		else
			@uri = Uri.create(uri_params)
		end

		# session[:short_uri] = @uri.short_uri
		redirect_to "/get/#{@uri.short_uri}"

	end

	private
	def uri_params
		params.require(:uri).permit(:original_uri,:short_uri,:user_id)
	end
end
