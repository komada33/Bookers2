class UsersController < ApplicationController
  #before_action :sign_in_user, only: [:edit, :update]
  #before_action :correct_user, only: [:edit, :update]
   def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
   end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(id: current_user), notice: 'You have updated user successfully.'
    else
      render "edit"
    end
  end

  def index
    @book = Book.new
    @users = User.all
  end

  private

  def  user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end
