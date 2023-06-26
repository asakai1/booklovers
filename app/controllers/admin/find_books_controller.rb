class Admin::FindBooksController < ApplicationController

  def index
    @genres = Genre.all
    @find_books = params[:genre_id].present? ? Genre.find(params[:genre_id]).find_books : FindBook.all
  end

  def show
    @find_book = FindBook.find(params[:id])
    @post_information = PostInformation.new
    @sell_book = SellBook.new
  end

  def destroy
    @find_book = FindBook.find(params[:id])
    @find_book.destroy
    redirect_to admin_find_books_path, notice: "お探しの書籍の投稿を削除しました。"
  end

end
