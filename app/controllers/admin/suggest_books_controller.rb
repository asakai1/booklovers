class Admin::SuggestBooksController < ApplicationController

  def show
    @suggest_book = SuggestBook.find(params[:id])
  end

  def index
    @suggest_books = SuggestBook.page(params[:page])
  end

  def destroy
    @suggest_book = SuggestBook.find(params[:id])
    @suggest_book.destroy
    redirect_to admin_suggest_books_path, notice: "おすすめの書籍の投稿を削除しました。"
  end

end
