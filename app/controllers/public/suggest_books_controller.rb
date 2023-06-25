class Public::SuggestBooksController < ApplicationController
  def new
    @suggest_book = SuggestBook.new
  end

  def create
    @suggest_book = current_user.suggest_books.new(suggest_book_params)
    @suggest_book.save
    redirect_to suggest_book_path(@suggest_book), notice: "おすすめの書籍の投稿に成功しました。"
  end

  def show
    @suggest_book = SuggestBook.find(params[:id])
  end

  def index
    @genres = Genre.all
    @suggest_books = params[:genre_id].present? ? Genre.find(params[:genre_id]).suggest_books : SuggestBook.all
  end

  def edit
    @suggest_book = SuggestBook.find(params[:id])
  end

  def update
    @suggest_book = SuggestBook.find(params[:id])
    @suggest_book.update(suggest_book_params)
    redirect_to suggest_book_path(@suggest_book), notice: "おすすめの書籍の更新に成功しました。"
  end

  def destroy
    @suggest_book = SuggestBook.find(params[:id])
    @suggest_book.destroy
    redirect_to suggest_books_path, notice: "おすすめの書籍の投稿を削除しました。"
  end


  private

  def suggest_book_params
    params.require(:suggest_book).permit(%i[genre_id title body])
  end

end
