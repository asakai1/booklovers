class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path, notice: "ジャンルを追加しました。"
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre(genre_params)
    @genre.save
    redirect_to admin_genres_path, notice: "ジャンル名を更新しました"
  end

  private

  def genre_params
    params.require(:genre).permit(%i[name is_deleted])
  end
end