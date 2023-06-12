class Public::FindBooksController < ApplicationController
  def new
    @find_book = FindBook.new
  end

  def create
    @find_book = FindBook.new(find_book_params)
    @find_book.user_id = current_user.id
    @find_book.save
    redirect_to find_book_path(@find_book.id), notice: "探している書籍の投稿に成功しました。"
  end

  def index
    @find_books = FindBook.all
  end

  def show
    @find_book = FindBook.find(params[:id])
    @user = @find_book.user
  end

  def edit
    @find_book = FindBook.find(params[:id])
  end

  def update
    @find_book = FindBook.find(params[:id])
    @find_book.update(find_book_params)
    redirect_to find_book_path(@find_book.id), notice: "探している書籍の投稿を更新に成功しました。"
  end

  def destroy
    @find_book = FindBook.find(find_book_params)
    @find_book.update(is_deleted: true)
    redirect_to find_books_path, notice: "探している書籍の投稿を削除しました。"
  end

  private

  def find_book_params
    params.require(:find_book).permit(%i[user_id genre_id title description])
  end
end
