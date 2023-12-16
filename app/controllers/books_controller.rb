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
    @books = Book.all
  end
  
  def show
    @user = @book.user
  end
  
  def edit
    
  end
  
  def update
      if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to books_path(@book)
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
  
  def set_book
  @book = Book.find(params[:id])
  end
  
  def check_user
    redirect_to books_path unless @book.user == current_user
  end
  
end