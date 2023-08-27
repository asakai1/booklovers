class Public::FindersController < ApplicationController
  before_action :authenticate_user!

  def finder
    @range = params[:range]

    if @range == "FindBook"
      @search = params[:search]
      @word = params[:word]
      @find_books = FindBook.looks(@search, @word)
    else
      @search = params[:search]
      @word = params[:word]
      @suggest_books = SuggestBook.looks(@search, @word)
    end
  end
end
