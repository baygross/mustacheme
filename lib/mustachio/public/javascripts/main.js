//set main javascript hooks
$(document).ready(function(){
  //async load social links
  $('#social_block').load('/get_social_media');
});


//Grabbed FB id, now show picture
function showMustache( uid ){
  $('#loading').hide();
  
  //first set image
  var path = "/m?src=http://graph.facebook.com/" + uid + "/picture?type=large";
  $('#mustache').attr('src', path);
  
  //then set name
  $.getJSON('http://graph.facebook.com/' + uid, function( r ){
      $('#name').text( r.name  );
  });
  
  //then show the page
  $('#success').show();
  
  //then set the FB share button
  $('#share_on_facebook').click(function(){
    var msg = ""
    FB.ui({ 
      method: 'feed',
      name: 'MustacheMe',
      link: 'http://www.MustacheMe.com/' + uid,
      picture: 'http://MustacheMe.com/images/fb_logo.png',
      caption: 'MustacheMe',
      description: msg
    });
  });
}


//could not grab FB id
function cantShowMustache(){
  $('#loading').hide();
  $('#failed').show();
}


