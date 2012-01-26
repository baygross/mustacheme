//set main javascript hooks
$(document).ready(function(){

  //async load social links
  $('#social_block').css('top', '-200px').load('/get_social_media');
  
  //fancy box about 
  $("#about a").fancybox({
		'hideOnContentClick': true,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'showCloseButton' : false
	});
	
});



