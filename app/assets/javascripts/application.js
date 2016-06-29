// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require social-share-button
//= bootstrap
//= bootstrap.min
//= require_tree .


$(function() {

	// Cache the window object
	var $window = $(window);

	// Parallax background effect
	$('section[data-type="background"]').each(function() {

		var $bgobj = $(this); // assigning the object

		$(window).scroll(function() {

			// scroll the background at var speed
			// the yPos is a negative value because we're scrolling it UP!

			var yPos = -($window.scrollTop() / $bgobj.data('speed'));

			// Put together our final background position
			var coords = '50% ' + yPos + 'px';

			// Move the background
			$bgobj.css({ backgroundPosition: coords });

		}); // end window scroll

	});

});
