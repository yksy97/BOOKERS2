class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    # @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
    
  def index
    @book = Book.new
    # @user = current_user
    @books = Book.all
  end
  
  def show
    # ActiveRecord::RecordNotFound in BooksController#show(12/14 8:30)
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    # is_matching_login_user
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    # @book.user_id = current_user.id
    if @book.save
       @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to books_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user_id = params[:id]
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end