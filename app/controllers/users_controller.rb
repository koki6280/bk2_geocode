class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		gon.user = @user
		@books = @user.books
		@book = Book.new
	end

	def edit
		    @user = User.find(params[:id])
		    user = current_user
	    if
	    	@user.id == current_user.id
	        render action: :edit
	    else
	  	    redirect_to user_path(user.id)
	    end
	end

	def update
			@user = User.find(params[:id])
		 if
		 	@user.update(user_params)
		 	flash[:notice] = "You have updated user successfully."
			redirect_to user_path(@user.id)
		else
	        flash.now[:alert] = 'error'
	        render action: :edit
	    end
    end

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
