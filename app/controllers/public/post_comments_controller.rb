class Public::PostCommentsController < ApplicationController

  def create
    suggest_book = SuggestBook.find(params[:suggest_book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.suggest_book_id = suggest_book.id
    comment.save
    redirect_to suggest_book_path(suggest_book)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to suggest_book_path(params[:suggest_book_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
