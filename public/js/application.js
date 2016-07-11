$(document).ready(function() {
    $('#error').mouseenter(function() {
        $(this).fadeTo('fast',0.25);
    });
    $('#error').mouseleave(function() {
        $(this).fadeTo('fast',1);
    });
    $('form').on('submit',function(event){
    	event.preventDefault();	    	
		$.ajax({
		  type: "POST",
		  url: '/form',
		  data: $(this).serialize(),
		  dataType: 'json',
		  success: function(response){
		  	$('table tr:first-child').after('<tr><td>' + response.long_url + '</td><td>' + 
		  		"<a href='" + response.short_url + "'>" + response.short_url + '</a>' + '</td><td>' + response.click_count + '</td></tr>');
		  },
		  error: function(request) {
		  	$('#error').text(request.responseJSON.error);
		          // alert('Error: ' + errorType + ' with message: ' + errorMessage)} 
		  }
		});


    })
});
