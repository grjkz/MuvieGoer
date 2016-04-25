class ReviewsController < ApplicationController
  
  # shows movie info and all associated reviews
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  # form for creating new review
  def new
    @review = Review.new
  end

  # create new review for movie
  def create
    @review = Review.create(review_params)
    @movie = Movie.find(params[:movie_id])
    @user = User.find(session[:user_id])
    @review.movie_id = @movie.id 
    @review.user_id = @user.id 
    @review.save

    redirect_to @movie
  end

  # user is editing his own review
  def edit
    @movie = Movie.find(params[:movie_id])
    # redirect for error
    redirect_to movies_path if !@movie.exists?
    
    @review = Review.where({user_id: 99, movie_id: @movie.id})
    # redirect for error
    redirect_to movie_reviews_path(@movie) if !@review.exists?


    
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
