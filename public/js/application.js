
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
  		console.log(mockResults);
  	});


  })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function customSerialize(form){
	console.log(form);
	return form.children(":first").val().split(" ").join("+")
}

var mockResults = [
{
Url: "http://tinysong.com/1mnup",
SongID: 42170983,
SongName: "Shake Me Down",
ArtistID: 560726,
ArtistName: "Cage the Elephant",
AlbumID: 5243810,
AlbumName: "Thank You, Happy Birthday"
},
{
Url: "http://tinysong.com/1lVRY",
SongID: 35169942,
SongName: "Aberdeen",
ArtistID: 560726,
ArtistName: "Cage the Elephant",
AlbumID: 5243810,
AlbumName: "Thank You, Happy Birthday"
},
{
Url: "http://tinysong.com/18m1Q",
SongID: 36729773,
SongName: "Right Before My Eyes",
ArtistID: 560726,
ArtistName: "Cage the Elephant",
AlbumID: 5243810,
AlbumName: "Thank You, Happy Birthday"
}
]