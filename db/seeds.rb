# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create({email: 'philipchoicodes@gmail.com', alias: 'admin0', password: 'asdf', password_confirmation: 'asdf', admin: true})
guest = User.create({email: 'philipchoicodes@gmail.com', alias: 'guest0', password: 'password', password_confirmation: 'password'})
lover = User.create({email: 'philipchoicodes@gmail.com', alias: 'MovieLover', password: 'movielover', password_confirmation: 'movielover'})
hater = User.create({email: 'philipchoicodes@gmail.com', alias: 'MOVIEHATR', password: 'moviehater', password_confirmation: 'moviehater'})

adventChildren = Movie.create({
	title: 'Final Fantasy VII: Advent Children', 
	synopsis: "An ex-mercenary is forced out of isolation when three mysterious men kidnap and brainwash the city's children afflicted with the Geostigma disease.", 
	image: File.new("#{Rails.root}/public/system/movies/seed/ffvii_poster.jpg")
	})
batmanVSuperman = Movie.create({
	title: "Batman v Superman: Dawn of Justice",
	synopsis: "Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.",
	image: File.new("#{Rails.root}/public/system/movies/seed/batmanvsuperman.jpg")
	})
pulpFiction = Movie.create({
	title: "Pulp Fiction",
	synopsis: "The lives of two mob hit men, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
	image: File.new("#{Rails.root}/public/system/movies/seed/pulpfiction.jpg")
	})

Review.create({user_id: guest.id, movie_id: adventChildren.id, rating: 10, comment: 'Best muvie EVAR! Nostalgic Epicness!!!!~'})
Review.create({
	user_id: lover.id,
	movie_id: batmanVSuperman.id,
	rating: 10,
	comment: 'This was soooooo awesome!',
	})
Review.create({
	user_id: lover.id,
	movie_id: pulpFiction.id,
	rating: 10,
	comment: 'JOHN TRAVOLTA!!!!!',
	})
Review.create({
	user_id: hater.id,
	movie_id: batmanVSuperman.id,
	rating: 3,
	comment: "A Batman who behaves likes a hissy teenage girl taking the fight to Superman because there's 'a 1% chance he will destroy earth' when he was shown up to be of not much use when a nuclear warhead was fired or when Doomsday was totaling the city; a Batman who was all set to write his legacy by killing Superman (who doesn't know for a fact if Aquaman and the lot are friend or foe) only to become his friend just like that even saying cringe worthy lines like 'Martha will not die tonight' and the even worse 'I will not fail him in death'...

A Superman who could hear Alfred talking to Bruce Wayne at the party from miles away but couldn't tell that a bomb was ticking away less than 5metres away; a Superman who overdoes the love sick puppy bit stopping just short of tears (to an aging Amy Adams gawd); a Superman who gives Batman a face to face warning because that always works with foes (perceived or not)...

A movie that has borrowed from James Bond (from Bruce Wayne's aging brooding looks that were probably set for 'smouldering' to the red herring L'Americain-White Portugese to 'key' action sequence linking back to a location from the earlier movie - former MI6 Building v Man of Steel destruction site - to the Aston Martin etc) and Avengers (nuclear warhead, enhanced Iron Man suit, dream sequences - gawd how many were there!?!) with a Jim Carrey/Riddler-like Lex Luther but in an infinitely more annoying Jesse Eisenberg...

Actually, 2 out of 10 may be too much for making us suffer two and half hours of a self-important drama but seeing how Warner Bros seems to have bought sooo many 10/10 reviews here, it's about right.

Only Gal Gadot looked like she was having fun albeit her brief appearance and therefore, she should be declared the rightful winner of Batman v Superman.",
	})
Review.create({
	user_id: hater.id,
	movie_id: pulpFiction.id,
	rating: 4,
	comment: "Meh. Could've been better",
	})
Review.create({
	user_id: guest.id,
	movie_id: batmanVSuperman.id,
	rating: 7,
	comment: "If you can get over the fact that Batman is essentially Iron man then you can enjoy a decent super hero flick. Ben is a solid leading Batman, disgruntled with life and the appearance of all these dang alien hero people tearing his city up. I hate that too! So Ben ponies up for one more ride, but he is going to need a medal suite and of course kryptonite baby! So he does and the battle ensues to epic proportions. But little does Batman know the Superman is actually a legit nice guy that we see kissing and loving Lois Lane. Snap. Totally torn! Fun action, decent story lines, mostly logical, if you are into the heroes or not this is a good one to go see.",
	})