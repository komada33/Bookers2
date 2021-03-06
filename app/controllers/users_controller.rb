class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(id: current_user)
  end

  def index
    @users = User.all

  end

  def  user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
