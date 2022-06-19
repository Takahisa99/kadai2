class BooksController < ApplicationController
  def new
    @book = Book.new
  end




  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to books_path
    else
      render :new
    end
  end








  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @post_comment = PostComment.new
  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to_book_path(book.id)
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
