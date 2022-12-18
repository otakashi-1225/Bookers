class BooksController < ApplicationController
  def create
    book  = Book.new(book_params)
    if book.save
      flash[:notice] = "Successfully Created!!"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "Error invalied Text..."
      @book = Book.new
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book  = Book.new
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
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Successfully Destroy!!"
      redirect_to books_path
    else
      @book = Book.new
      @books = Book.all
      render :index
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
