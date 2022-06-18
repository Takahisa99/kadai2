class UsersController < ApplicationController
  def show
    @user = Book.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = Book.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user[:id])
    else
    @user = User.all
    render :edit
    end
  end
end
