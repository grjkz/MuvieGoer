# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create({alias: 'admin0', password: 'asdf', password_confirmation: 'asdf', admin: true})

adventChildren = Movie.create({
	title: 'Final Fantasy VII: Advent Children', 
	synopsis: "An ex-mercenary is forced out of isolation when three mysterious men kidnap and brainwash the city's children afflicted with the Geostigma disease.", 
	image: File.new("public/system/movies/seed/ffvii_poster.jpg")
	})

review = Review.create({user_id: admin.id, movie_id: adventChildren.id, rating: 10, comment: 'Best muvie EVAR! Nostalgic Epicness!!!!~'})
