class ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @movie = Movie.find(params[:movie_id])
    @user = User.find(session[:user_id])
    @review.movie_id = @movie.id 
    @review.user_id = @user.id 
    @review.save

    redirect_to @movie
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
