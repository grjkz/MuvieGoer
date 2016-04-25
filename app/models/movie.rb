class Movie < ActiveRecord::Base
	# title
	# synopsis
	# picture
	# has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	 #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	# style: original will overwrite the actual uploaded image. useful for gigantic image files
	has_attached_file :image, styles: { small: "110x170", med: "180x240", original: '240x360' }, default_url: 'http://placehold.it/180x240'
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }

	has_many :reviews, :dependent => :delete_all # || :destroy

	def self.search(search)
		# search through the title and synopsis columns
		# combine the results
		# remove any duplicate results
	  ( where("title ILIKE ?", "%#{search}%") + where("synopsis ILIKE ?", "%#{search}%") ).uniq
	end

	# after_save :destroyOriginal

	private

	# destroys the original size uploaded image to save space
	# you can also just set the style, 'original' to whatever you want and it should replace the uploaded one
	# def destroyOriginal
	# 	File.unlink(self.image.url) 
	# 	# self.<column name>.path # gives absolute path from computer root
	# 	# self.<column name>.url # gives absolute path from app root
	# end
end