class HomesController < ApplicationController
  def top
    @book=Book.new
    @user = current_user
    @books = Book.all
  end

  
  def about
  end
end
