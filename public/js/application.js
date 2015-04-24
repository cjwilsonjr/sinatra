$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $(document).on("submit", "#song-search", function(event){
  	event.preventDefault();

  	var form = $(this);
  	var url = "http://tinysong.com/s/";
  	var data = customSerialize(form);
  	var APIKey = "6463d07a7698e5ed6b1da08d395d6db6";
  	var fullUrl = url + data + "?format=json&limit=3&key=" + APIKey;
  	
  	var request = $.ajax({
  		url: fullUrl,
  		dataType: "jsonp",
  		method: "GET",
  	});

  	request.always(function(data, textStatus, jqXHR){
  		var xyz = data;
  	});


  })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

var customSerialize = function(form){
	console.log(form);
	return form.children(":first").val().split(" ").join("+")
}