class MoviesController < ApplicationController

	
  def index
    if params[:search]
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.order("created_at DESC")
    end
  end

  # for users who actually type the show path, redirect to reviews
  def show
    redirect_to "#{movie_path(params[:id])}/reviews"
  end

end
