class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed in successfully."
      redirect_to user_path
    else
      @users = User.all
      render :index
    end
  end
  
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  else
    render :edit
  end
  end

  private
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end

