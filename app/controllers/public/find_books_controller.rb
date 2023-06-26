class Public::FindBooksController < ApplicationController
  def new
    @find_book = FindBook.new
  end

  def create
    @find_book = FindBook.new(find_book_params)
    @find_book.user_id = current_user.id
    # 投稿ボタンを押下
    if params[:post]
      if @find_book.save(context: :publicize)
        redirect_to find_book_path(@find_book), notice: "探している書籍の投稿に成功しました。"
      else
        render :new, alert: "投稿できませんでした。入力内容を内容をご確認ください。"
      end
    # 下書きボタンを押下
    else
      if @find_book.update(is_draft: true)
        redirect_to user_path(current_user), notice: "下書きを保存しました。"
      else
        render :new, alert: "下書きを保存できませんでした。入力内容をご確認ください。"
      end
    end
  end

  def index
    @genres = Genre.all
    @find_books = params[:genre_id].present? ? Genre.find(params[:genre_id]).find_books : FindBook.all
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
    # 下書きを公開する
    if params[:publicize_draft]
      # バリデーション適用
      @find_book.attributes = find_book_params.merge(is_draft: false)
      if @find_book.save(context: :publicize)
        redirect_to find_book_path(@find_book), notice: "お探しの書籍の投稿に成功しました。"
      else
        @find_book.is_draft = true
        render :edit, alert: "投稿できませんでした。入力内容を内容をご確認ください。"
      end
    # 公開済みの投稿を更新
    elsif params[:update_post]
      @find_book.attributes = find_book_params
      if @find_book.save(context: :publicize)
        redirect_to find_book_path(@find_book), notice: "投稿の更新に成功しました。"
      else
        render :edit, alert: "更新できませんでした。入力内容をご確認ください。"
      end
    # 下書きのまま更新
    else
      if @find_book.update(find_book_params)
        redirect_to find_book_path(@find_book), notice: "下書きを更新しました"
      else
        render :edit, alert: "更新できませんでした。入力内容をご確認ください。"
      end
    end
  end

  def destroy
    @find_book = FindBook.find(params[:id])
    @find_book.destroy
    redirect_to find_books_path, notice: "お探しの書籍の投稿を削除しました。"
  end

  private

  def find_book_params
    params.require(:find_book).permit(%i[genre_id title body is_draft])
  end

end
