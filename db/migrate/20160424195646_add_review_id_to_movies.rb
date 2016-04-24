class AddReviewIdToMovies < ActiveRecord::Migration
  def change
  	add_reference :movies, :review_id, index: true, foreign_key: true
  end
end
