class UsersController < ApplicationController
	def new_user
		@user= User.new
	end	

	def create
		@user= User.new(user_params)
		if @user.save
			flash[:success]= "Welcome to MyBlog #{@user.username}"
			redirect_to articles_path
		else
			render 'new_user'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password_digest)
	end
end