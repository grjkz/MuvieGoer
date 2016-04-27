$(function() {
	// enable star ratings for review#new and review#edit
	$('#rateyo').rateYo({
		numStars: 10,
		maxValue: 10,
		rating: $('#review_rating').val(),
		fullStar: true,
		onSet: function(rating, rateYoInstance) {
			$('#review_rating').val(rating);
		}
	});

});