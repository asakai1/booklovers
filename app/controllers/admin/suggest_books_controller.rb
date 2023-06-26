class Admin::SuggestBooksController < ApplicationController

  def show
    @suggest_book = SuggestBook.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @genres = Genre.all
    @suggest_books = params[:genre_id].present? ? Genre.find(params[:genre_id]).suggest_books : SuggestBook.all
  end

  def destroy
    @suggest_book = SuggestBook.find(params[:id])
    @suggest_book.destroy
    redirect_to admin_suggest_books_path, notice: "おすすめの書籍の投稿を削除しました。"
  end

end
