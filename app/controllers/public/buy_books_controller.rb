class Public::BuyBooksController < ApplicationController

  def new
    @sell_book = SellBook.find(params[:sell_book_id])
    @buy_book = BuyBook.new
  end

  def create
    @sell_book = SellBook.find(params[:sell_book_id])
    @buy_book = BuyBook.new(buy_book_params)
    @buy_book.user_id = current_user.id
    @buy_book.sell_book_id = @sell_book.id
    @buy_book.save
    redirect_to sell_book_buy_books_path
  end

  def show
    @sell_book = SellBook.find(params[:sell_book_id])
    @buy_book = @sell_book.buy_book
  end

  private

  def buy_book_params
    params.require(:buy_book).permit(%i[name postal_code address telephone_number payment_method])
  end

end
