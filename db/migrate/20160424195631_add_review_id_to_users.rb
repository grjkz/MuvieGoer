class AddReviewIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :review_id, :integer
  	add_index :users, :review_id
  end
end
