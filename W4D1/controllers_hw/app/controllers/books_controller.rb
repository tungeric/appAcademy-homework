class BooksController < ApplicationController
  def index
    # your code here
    render json: Book.all
  end

  def new
    # your code here
    @book = Book.new
    render :new
  end

  def create
    # your code here
    @book = Book.new(book_params)

    if @book.save
      # cat_url(@cat) == /cats/...
      flash[:notice] = "Created #{@book.name}"
      redirect_to cat_url(@book)
    else
      # redirect_to new_cat_url
      render :new

      # render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Deleted #{book.name}"
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
