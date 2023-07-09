class Admin::SuggestBooksController < ApplicationController

  def show
    @suggest_book = SuggestBook.find(params[:id])
  end

  def index
    @suggest_books = SuggestBook.page(params[:page])
  end

  def edit
    @suggest_book = SuggestBook.find(params[:id])
  end

  def update
    @suggest_book = SuggestBook.find(params[:id])
    if @suggest_book.update(suggest_book_params)
      redirect_to admin_suggest_book_path(@suggest_book), notice: "おすすめの書籍の更新に成功しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @suggest_book = SuggestBook.find(params[:id])
    @suggest_book.destroy
    redirect_to admin_suggest_books_path, notice: "おすすめの書籍の投稿を削除しました。"
  end

  private

  def suggest_book_params
    params.require(:suggest_book).permit(%i[genre_id title author body])
  end


end
