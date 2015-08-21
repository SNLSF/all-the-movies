$(document).on('page:change', function() {

	console.log("Requesting Movies...");

	var request = $.ajax({
		url: "https://metacritic-2.p.mashape.com/movie-list/new-releases?order_by=metascore",
		type: "GET",
		data: {},
		dataType: 'json',
		beforeSend: function(xhr) {
			xhr.setRequestHeader("X-Mashape-Authorization", "MxqqvbLiSHmshk7YBEE99SbHQOfip1rdT7pjsn2eUqlD5cINfx")
		}
	});

	request.success(function(data) {
		request = $.ajax({
			url: '/movies',
			type: 'POST',
			data: {data: data},
			dataType: 'json'
		});
		request.success(function(data) {
			console.log(data);
			for (var i=0; i < data["movies"].length; i++) {
				$('.wrapper_movies').append("<div class='tile_movie-title' data-id="+ (i+1) +"><div class='tile_movie-title_inner'><img src="+ data["movies"][i]["thumbnail"] +" class='media_thumbnail'> <a href='/movies/"+ (i+1) +"'>"+ data["movies"][i]["title"] +" </a><div class='tile_movie-title_score'>Metacritic Score: "+ data["movies"][i]["score"] +" </div></div></div>");
			};
		})
	})

	request.error(function(err) {
		alert(err);
	});

});