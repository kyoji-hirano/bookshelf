class ReviewCommentsController < ApplicationController
  def index
    @user = current_user
    @comments = ReviewComment.all
    @review_comment = ReviewComment.new(user_id: @user.id)
    @books = Book.pluck(:name, :id)
  end

  def show
  end

  def create
    @comment = ReviewComment.new(comment_params)
    if @comment.save
      flash[:succes] = "ReviewComment created!"
      redirect_to review_comments_url
    else
      render 'static_pages/home'
    end
  end

  def update
  end

  def destroy
    @comment = ReviewComment.find_by(id: params[:id])
    @comment.destroy
    flash[:succes] = "ReviewComment deleted!"
    redirect_to review_comments_url
  end

  private

  def comment_params
    params.require(:review_comment).permit(:content, :user_id, :book_id)
  end
  
end
