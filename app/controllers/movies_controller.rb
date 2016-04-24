class MoviesController < ApplicationController

	
  def index
    @movies = Movie.all
  end

  def new

  end

  # def create
  #   @movie = Movie.create(movie_params)
  #   if (@movie.save)

  #   end
  # end

  def show
    @movie = Movie.find(params[:id])

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  # def movie_params
  #   params.require(:movie).permit(:title,:synopsis,:)
  # end
end
