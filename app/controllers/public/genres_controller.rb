class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:genre_name])
  end
end
