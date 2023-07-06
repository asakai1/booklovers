class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    suggest_book = SuggestBook.find(params[:suggest_book_id])
    favorite = current_user.favorites.new(suggest_book_id: suggest_book.id)
    favorite.save
    redirect_to suggest_book_path(suggest_book)
  end

  def destroy
    suggest_book = SuggestBook.find(params[:suggest_book_id])
    favorite = current_user.favorites.find_by(suggest_book_id: suggest_book.id)
    favorite.destroy
    redirect_to suggest_book_path(suggest_book)
  end
end
