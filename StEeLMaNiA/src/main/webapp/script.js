$(document).ready(function() { 
   
		$('.cta h1').animate({
			opacity: 1,
			top: 0
		}, 600, function () {
			$('.cta p').animate({
				opacity: 1,
				top: 0
			}, 600, function() {
				$('.cta .btn-pill').animate({
					opacity: 1,
					top: 0
				}, 600);
			});
		});
   
 });