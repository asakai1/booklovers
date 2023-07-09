class Admin::FindBooksController < ApplicationController

  def index
    @find_books = FindBook.page(params[:page])
  end

  def show
    @find_book = FindBook.find(params[:id])
  end

  def edit
    @find_book = FindBook.find(params[:id])
  end

  def update
    @find_book = FindBook.find(params[:id])
      if @find_book.update(find_book_params)
        redirect_to admin_find_book_path(@find_book), notice: "投稿の更新に成功しました。"
      else
        render 'edit'
      end
  end

  def destroy
    @find_book = FindBook.find(params[:id])
    @find_book.destroy
    redirect_to admin_find_books_path, notice: "お探しの書籍の投稿を削除しました。"
  end

  private

  def find_book_params
    params.require(:find_book).permit(%i[genre_id title author body])
  end

end
