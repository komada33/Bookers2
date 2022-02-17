class UsersController < ApplicationController
   def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
   end

  def edit
    @user = current_user
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = current_user
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

end
