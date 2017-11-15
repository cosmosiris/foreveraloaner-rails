class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@review = Review.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to user_path(@user)
			session[:id] = @user.id
		else
			@errors = @user.errors.full_messages
			render :new, status: 422
		end
	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
