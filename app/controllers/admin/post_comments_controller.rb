class Admin::PostCommentsController < ApplicationController

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to suggest_book_path(params[:suggest_book_id])
  end

end
