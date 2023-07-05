class Public::PostCommentsController < ApplicationController

  def create
    suggest_book = SuggestBook.find(params[:suggest_book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.suggest_book_id = suggest_book.id
    if comment.save
      redirect_to suggest_book_path(suggest_book), notice: "コメントを投稿しました。"
    else
      @error_comment = comment
      @suggest_book = SuggestBook.find(params[:suggest_book_id])
      @post_comment = PostComment.new
      render 'public/suggest_books/show'
    end
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
