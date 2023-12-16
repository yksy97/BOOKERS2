class UsersController < ApplicationController
  def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(@user)
  else
    @users = User.all
    render :index
  end
  end

  def show
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    
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
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    redirect_to(root_url) unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end

