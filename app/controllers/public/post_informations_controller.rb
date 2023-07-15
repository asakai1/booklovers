class Public::PostInformationsController < ApplicationController
  before_action :authenticate_user!

  def create
    find_book = FindBook.find(params[:find_book_id])
    information = current_user.post_informations.new(post_information_params)
    information.find_book_id = find_book.id
    if information.save
      redirect_to find_book_path(find_book)
    else
      @error_information = information
      @find_book = FindBook.find(params[:find_book_id])
      @post_information = PostInformation.new
      @sell_book = SellBook.new
      render 'public/find_books/show'
    end
  end

  def destroy
    PostInformation.find(params[:id]).destroy
    redirect_to find_book_path(params[:find_book_id])
  end

  private

  def post_information_params
    params.require(:post_information).permit(:information)
  end
end
