class Admin::FindBooksController < ApplicationController

  def index
    @find_books = FindBook.page(params[:page])
  end

  def show
    @find_book = FindBook.find(params[:id])
  end

  def destroy
    @find_book = FindBook.find(params[:id])
    @find_book.destroy
    redirect_to admin_find_books_path, notice: "お探しの書籍の投稿を削除しました。"
  end

end
