$(document).on('page:change', function() {

	var request = $ajax({
		url: "https://metacritic-2.p.mashape.com/movie-list/new-releases?order_by=metascore",
		type: "GET",
		data: {},
		dataType: 'json',
		beforeSend: function(xhr) {
			xhr.setRequestHeader("X-Mashape-Authorization", "MxqqvbLiSHmshk7YBEE99SbHQOfip1rdT7pjsn2eUqlD5cINfx")
		}
	});

	request.success(function(data) {
		console.log("we did it!");
		// request = $ajax({
		// 	url: '/movies',
		// 	type: 'POST',
		// 	data: {data: data},
		// 	dataType: 'json'
		// });
	})

});