class MoviesController < ApplicationController

	
  def index
    if params[:search]
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.order("created_at DESC")
    end
  end


end
