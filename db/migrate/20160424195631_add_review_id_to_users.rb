class AddReviewIdToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :review_id, index: true, foreign_key: true
  end
end
