class BooksController < ApplicationController
  def top
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end

  def new
  @book = Book.new
  render partial: "User_info/new_books", locals: { book: @book }
  end
  
  def book
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      
      render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  
def show
  @book = Book.find(params[:id])
  @user = @book.user
end
  
  def edit
  @book = Book.find(params[:id])
  @user = current_user
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book  
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end