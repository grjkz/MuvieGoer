class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_inclusion_of :rating, in: 0..10, :message => "is invalid! Don't try to break the rating system!"
end
