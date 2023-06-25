class Public::SellBooksController < ApplicationController

  def create
    sell_book = SellBook.new(sell_book_params)
    sell_book.user_id = current_user.id
    sell_book.save
    redirect_to find_book_path(sell_book.find_book)
  end

  def destroy
    sell_book = SellBook.find(params[:id]).destroy
    redirect_to find_book_path(sell_book.find_book)
  end

  private

  def sell_book_params
    params.require(:sell_book).permit(%i[find_book_id price shipping_date])
  end

end
