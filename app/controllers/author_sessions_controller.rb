class AuthorSessionsController < ApplicationController
	before_filter

	def new
	end

	def create
		if login(params[:email], params[:password])
			redirect_back_or_to(articles_path, notice: 'Logged in successfully')			
		else
			flash.notice = 'Login failed'
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:articles, notice: 'Logged out!')
	end

end
