class UsersController < ApplicationController
	
	def existing_user
		#@user= User.
	end

	def index
		@users= User.all.paginate(page: params[:page], per_page: 5)
	end

	def new_user
		#User.find_by(email: params)
		@user= User.new
	end	

	def new

	end

	def create
		@user= User.new(user_params)
		if @user.save
			flash[:success]= "Welcome to MyBlog #{@user.username}"
			redirect_to users_path
		else
			render 'new_user'
		end
	end

	def edit
		@user= User.find(params[:id])
	end

	def update
		@user= User.find(params[:id])
		@user.attributes = user_params
		if @user.update(user_params)
			flash[:success] = "Your Account was updated successfully"
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user.destroy
	end


	private
	def user_params
		params.require(:user).permit(:username, :email, :password_digest)
	end
end	