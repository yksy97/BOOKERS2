class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to new_book_path
    # redirect_to books_path
  end
    
  def index
    @books = Bool.all
  end
  
  def show
    @book = book_path(params[:id])


  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end