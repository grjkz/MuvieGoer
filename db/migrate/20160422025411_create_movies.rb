class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.attachment :image

      t.timestamps null: false
    end
  end
end
