class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    @books = @user.books
    @book = Book.find_by(params[:id])
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
    @user = User.find_by(params[:id])

  end

  private

  def  user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
