class Public::HomesController < ApplicationController

  def top
    @find_books = FindBook.order('id ASC').limit(4)
  end
end
