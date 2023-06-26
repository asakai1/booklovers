class Public::PostInformationsController < ApplicationController
  def create
    find_book = FindBook.find(params[:find_book_id])
    information = current_user.post_informations.new(post_information_params)
    information.find_book_id = find_book.id
    information.save
    redirect_to find_book_path(find_book)
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
