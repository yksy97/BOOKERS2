class UsersController < ApplicationController
  def index
    @user = User.index(user_params)
    @book.user_id = current_user.id
  if @user.save
     flash[:notice] = "Signed in successfully."
     redirect_to users_path(@user.id)
  else
     @users = User.all
     render :index
  end
    
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end

  
  # def is_matching_login_user
  #   user = User.find(params[:id])
  #   unless user.id == current_user.id
  #     redirect_to post_images_path
  #   end
  # end
