$(function() {
	console.log('global.js linked')

	
	// Toggles mobile nav bar
	$('.button-collapse').sideNav();

	// Initializes materialize Select tags
	$('select').material_select();
})