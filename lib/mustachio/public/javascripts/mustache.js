
//Grabbed FB id, now show picture
function showMustache( uid ){
  
  //first set image
  var path = "/m?src=http://graph.facebook.com/" + uid + "/picture?type=large";
  $('#mustache').attr('src', path);
  
  //then set name
  var uname
  $.getJSON('http://graph.facebook.com/' + uid, function( r ){
      $('#name').text( r.name  );
       uname = r.username;
  });
  
  //wait for image to load
  $('#mustache').load(function(){
    //then show the page
    $('#loading').hide();
    $('#success').show();
    $('#social_block').hide().css('top', '7px').delay(1000).fadeIn(2000);
  });
  
  //then set the FB share button
  $('#warn a').click(function(){
    var msg = ""
    FB.ui({ 
      method: 'feed',
      name: 'MustacheMe',
      link: 'http://www.MustacheMe.com/' + uname,
      picture: 'http://www.MustacheMe.com/' + uname,
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
