class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # before_action :set_group, only: [:new, :show, :edit, :update, :destroy, :create]
  # before_action :books_group_member?, only: [:new, :show, :edit, :update, :destroy, :create]

  def index
    @books = Book.all
  end

  def show
    @comments = ReviewComment.where(book_id: @book.id)

  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_url(@book), notice: "「#{@book.name}を登録しました。」"
    else
      render :new
    end
  end

  def update
    @book.update!(book_params)
    redirect_to book_url(@book), notice: "「#{@book.name}」を更新しました。"
  end

  def destroy
    @book.destroy
    redirect_to book_url(@book), notice: "「#{@book.name}」を削除しました。"
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :image, :group_id, :category_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
  
  def books_group_member?
    redirect_to group_url(@group) unless @book.group.user_ids.include?(current_user.id)
  end

end
