class UsersController < ApplicationController
  def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(@user)
  else
    @users = User.all
    flash.now[:notice] = "errors prohibited this obj from being saved:"
    render :index
  end
  end
  
  def index
    @users = User.all
    @books = Book.all
  end
  
  def show
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
      flash.now[:notice] = "errors prohibited this obj from being saved:"
      render :edit
    end
  end

  private
  
  def check_user
    redirect_to(root_url) unless @user == current_user
  end
  

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end

