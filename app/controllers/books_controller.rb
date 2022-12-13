class BooksController < ApplicationController
  def create
    @book  = Book.new(book_params)
    @books = Book.all

    if @book.save
      flash[:notice] = "Successfully Created!!"
      render :index
    else
      flash[:notice] = "Error invalied Text..."
      render :index
    end
  end

  def index
    @books = Book.all
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Successfully Update!!"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "Error invalied Text..."
      render :edit
    end
  end

  def destory

  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end
end
