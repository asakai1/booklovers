class Public::BuyBooksController < ApplicationController

  def new
    @buy_book = BuyBook.new
  end

  def create
  end

  def show
  
  end

  private

  def buy_book_params
    params.require(:buy_book).permit(%i[name postal_code address telephone_number payment_method])
  end

end
