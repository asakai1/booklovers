class Public::SellBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    sell_book = SellBook.new(sell_book_params)
    sell_book.user_id = current_user.id
    if sell_book.save
      redirect_to find_book_path(sell_book.find_book), notice: "出品に成功しました"
    else
      render 'public/find_books/show'
    end
  end

  def destroy
    sell_book = SellBook.find(params[:id]).destroy
    redirect_to find_book_path(sell_book.find_book), notice: "出品を取り消しました"
  end

  private

  def sell_book_params
    params.require(:sell_book).permit(%i[find_book_id price shipping_date])
  end

end
