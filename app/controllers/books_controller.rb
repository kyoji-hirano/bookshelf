class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show

  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_url, notice: "「#{@book.name}を登録しました。」"
    else
      render :new
    end
  end

  def update
    @book.update!(book_params)
    redirect_to books_url, notice: "「#{@book.name}」を更新しました。"
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "「#{@book.name}」を削除しました。"
  end

  private

  def book_params
    params.require(:book).permit(:name, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
