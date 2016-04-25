class ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def new
    @review = Review.new
  end

  def create
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
