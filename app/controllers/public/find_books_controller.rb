class Public::FindBooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @find_book = FindBook.new
  end

  def create
    @find_book = FindBook.new(find_book_params)
    @find_book.user_id = current_user.id
      if @find_book.save
        redirect_to find_book_path(@find_book), notice: "探している書籍の投稿に成功しました。"
      else
        render 'new'
      end
  end

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @find_books = @genre.find_books.page(params[:page])
    else
      @find_books = FindBook.page(params[:page])
    end
  end

  def show
    @find_book = FindBook.find(params[:id])
    @post_information = PostInformation.new
    @sell_book = SellBook.new
  end

  def edit
    @find_book = FindBook.find(params[:id])
  end

  def update
    @find_book = FindBook.find(params[:id])
      if @find_book.update(find_book_params)
        redirect_to find_book_path(@find_book), notice: "投稿の更新に成功しました。"
      else
        render 'edit'
      end
  end

  def destroy
    @find_book = current_user.find_books.find(params[:id])
    @find_book.destroy
    redirect_to find_books_path, notice: "お探しの書籍の投稿を削除しました。"
  end

  private

  def find_book_params
    params.require(:find_book).permit(%i[genre_id title author body])
  end

end
