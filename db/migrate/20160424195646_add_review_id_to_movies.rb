class AddReviewIdToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :review_id, :integer
  	add_index :movies, :review_id
  end
end
