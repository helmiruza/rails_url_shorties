class UrisController < ApplicationController
	
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

	# def short_uri
	# 	@uri = Uri.find_by(short_uri: short_uri)
	# end

	def get
		if session[:username] != nil
			@user = User.find_by_username(session[:username])
			@uris = Uri.where(user_id: @user.id)
		else
			@uri = Uri.where(user_id: nil).last
			@uris = Uri.where(user_id: nil)
		end

	end

	def geturi
		uri = Uri.find_by(short_uri: params[:short_uri])
		
		uri.click_count += 1
		uri.save

		redirect_to uri.original_uri
	end

	private

	def uri_params
		params.require(:uri).permit(:original_uri,:short_uri,:user_id)
	end

end