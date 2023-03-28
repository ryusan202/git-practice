class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
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
    @books = @users.all
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
    @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to books_path(current_user)
  end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
