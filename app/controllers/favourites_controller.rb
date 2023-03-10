class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show]

  def index
    @favourites = Favourite.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(favourite_params)
    if @favourite.save
      redirect_to favourite_path(@favorite)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:name, :description)
  end

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
