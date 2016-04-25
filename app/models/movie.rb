class Movie < ActiveRecord::Base
	# title
	# synopsis
	# picture
	# has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	 #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_attached_file :image, styles: { small: "110x170", med: "180x240", large: "240x360" }, default_url: 'http://placehold.it/180x240'
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }

	has_many :reviews


	after_save :destroyOriginal

	private

	# destroys the original size uploaded image to save space
	# you can also just set the style, 'original' to whatever you want and it should replace the uploaded one
	def destroyOriginal
		File.unlink(self.image.path) # self.<column name>.path
	end
end