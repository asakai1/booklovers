class Admin::SellBooksController < ApplicationController

  def destroy
    sell_book = SellBook.find(params[:id]).destroy
    redirect_to admin_find_book_path(sell_book.find_book), notice: "出品を取り消しました"
  end

end
