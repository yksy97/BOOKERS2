class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      flash.now[:notice] = "errors prohibited this obj from being saved:"
      render :index
    end
  end
    
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to books_path
    else
      flash.now[:notice] = "errors prohibited this obj from being saved:"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def check_user
    redirect_to books_path unless @book.user == current_user
  end
  
end

