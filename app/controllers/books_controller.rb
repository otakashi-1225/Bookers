class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Successfully Created!!"
      @books = Book.all
      render :index
    else
      @books = Book.all
      flash[:notice] = "Error invalied Text..."
      render :index
    end
  end

  def index
    @books = Book.all
  end


  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end
end
