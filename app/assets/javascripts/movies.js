$(function() {
	// enable static star ratings for movie details
	$('.static-rating').each(function(index, el) {
		$(el).rateYo({
			starWidth: "12px",
			numStars: 10,
			maxValue: 10,
			precision: 1,
			rating: this.getAttribute('data-value') === "-" ? 0 : this.getAttribute('data-value'),
			readOnly: true
		});
	});
});