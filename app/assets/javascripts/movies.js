$(function() {
	// enable static star ratings for movie details
	$('.static-rating').each(function(index, el) {
		$(el).rateYo({
			maxValue: 10,
			precision: 1,
			rating: this.getAttribute('data-value'),
			readOnly: true
		});
	});
});