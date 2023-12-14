class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    # redirect_to books_path
  end
    
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    # ActiveRecord::RecordNotFound in BooksController#show(12/14 8:30)
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])  
    
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
end