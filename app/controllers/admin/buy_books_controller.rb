class Admin::BuyBooksController < ApplicationController

  def show
    @sell_book = SellBook.find(params[:sell_book_id])
    @buy_book = @sell_book.buy_book
  end

end
