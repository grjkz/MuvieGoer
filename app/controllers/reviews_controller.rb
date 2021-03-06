class ReviewsController < ApplicationController
  before_action :logged_in_user, except: [:index]


  # shows movie info and all associated reviews
  def index
    # redirect user if attemping to access non-existant record (to prevent server error)
    return redirect_to movies_path if (!Movie.exists?(params[:movie_id]))
    
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews.order("created_at DESC")

    # find user's review
    @userReview = @reviews.find_by(user_id: session[:user_id])
  end

  # form for creating new review
  def new
    @review = Review.new
  end

  # create new review for movie
  def create
    # make sure user hasn't already reviewed the movie
    if (!Review.exists?({user_id: session[:user_id], movie_id: params[:movie_id]}))
      @review = Review.create(review_params)
      @movie = Movie.find(params[:movie_id])
      @user = User.find(session[:user_id])
      @review.movie_id = @movie.id
      @review.user_id = @user.id
      if (!@review.save)
        flash[:error] = @review.errors.full_messages
        return redirect_to :back
      end
    else
      flash[:error] = ["Can not submit another review!"]
    end

    redirect_to movie_reviews_path(params[:movie_id])
  end

  # user is editing his own review
  def edit
    @movie = Movie.find(params[:movie_id]) # throws rails error if not found in db :/
    # no matter the :id of the review, user can only modify their own movie review
    @review = Review.find_by(user_id: session[:user_id], movie_id: @movie.id)
    # redirect the user if trying to edit a review he never created
    redirect_to movie_reviews_path(@movie) if !@review
    
  end

  def update
    # no matter the :id of the review, user can only modify their own movie review
    @review = Movie.find(params[:movie_id]).reviews.find_by(user_id: session[:user_id])
    if @review.update_attributes(review_params) # automatically saves and returns true or false
      redirect_to movie_reviews_path(@review.movie) # be careful; _path takes the variable's .id instead of the correct .movie_id
    else
      flash[:error] = ["Invalid Input!"]
      redirect_to action: :edit
    end
  end

  def destroy
    Movie.find(params[:movie_id]).reviews.find_by(user_id: session[:user_id]).delete
    redirect_to movie_reviews_path(params[:movie_id])
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  
end
