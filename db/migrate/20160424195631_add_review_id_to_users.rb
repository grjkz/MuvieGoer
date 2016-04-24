class AddReviewIdToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :review_id, index: true
  end
end
