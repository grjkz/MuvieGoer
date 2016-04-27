class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_inclusion_of :rating, in: 0..10
end
