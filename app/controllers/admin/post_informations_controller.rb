class Admin::PostInformationsController < ApplicationController

  def destroy
    PostInformation.find(params[:id]).destroy
    redirect_to find_book_path(params[:find_book_id])
  end

end
