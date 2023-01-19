class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
    redirect_to book_path(current_user)
    else
    @user=current_user
    @books=Book.all
    render :index
    end
  end
 
  def index
    @book=Book.new
    @user=current_user
    @books=Book.all
  end

  def show
    @user=current_user
    @book=Book.find(params[:id])
    redirect_to book_path(current_user)
  end

  def edit
    
  end
  
  private
 
  def book_params
    params.require(:book).permit(:title, :body , :user_id)
  end
end
