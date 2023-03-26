class UsersController < ApplicationController
  def new
    @user = User.new
    @book = Book.new
  end  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Book was successfully created."
      redirect_to @user
    else
      @user = User.all
      render :index
    end
  end
  
def index
  @users = User.all
  @book = Book.new
  if user_signed_in?
    @user = current_user
    @books = @user.books
  end
  @users = User.all
end
 
def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books
  @introduction = @user.introduction
  @users = User.all
end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/users"
    else
      render :users
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end

end