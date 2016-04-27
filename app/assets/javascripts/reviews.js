$(function() {
	// enable star ratings for review#new and review#edit
	$('#rateyo').rateYo({
		maxValue: 10,
		rating: $('#review_rating').val(),
		halfStar: true,
		onSet: function(rating, rateYoInstance) {
			$('#review_rating').val(rating);
		}
	});

});