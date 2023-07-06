class Public::FindersController < ApplicationController
  before_action :authenticate_user!

  def finder
    @range = params[:range]

    if @range == "FindBook"
      @find_books = FindBook.looks(params[:search], params[:word])
      # 下記３文をまとめて記述↑
      # @search = params[:search]
      # @word = params[:word]
      # _@find_books = FindBook.looks(search, word)
    else
      @suggest_books = SuggestBook.looks(params[:search], params[:word])
    end
  end
end
