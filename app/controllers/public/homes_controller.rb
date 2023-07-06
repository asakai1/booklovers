class Public::HomesController < ApplicationController

  # トップページ
  def top
    # 投稿の新着4件を取得
    @find_books = FindBook.order('id ASC').limit(3)
    @suggest_books = SuggestBook.order('id ASC').limit(3)
  end

  def about
  end

end
