class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def new; end

	def create
		# {"data"=>{"results"=>{"0"=>{"name"=>"Inside Out", "url"=>"http://www.metacritic.com/movie/inside-out-2015", "rlsdate"=>"2015-06-19", "score"=>"94", "rating"=>"PG", "cast"=>"Amy Poehler, Bill Hader, Lewis Black, Mindy Kaling, Phyllis Smith", "genre"=>"Adventure, Drama, Fantasy, Comedy, Animation, Family", "avguserscore"=>"8.9", "runtime"=>"94 min", "thumbnail"=>"http://static.metacritic.com/images/products/movies/6/4ef454cab506fab08119c0efc252a981-53.jpg"}, ...
		movies_data = params[:data]
			movies_data["results"].each do |movie|
				begin
					Movie.create!(
						title: movie[1]["name"], 
						genre: movie[1]["genre"],
						release_date: movie[1]["rlsdate"],
						thumbnail: movie[1]["thumbnail"],
						url: movie[1]["url"],
						score: movie[1]["score"] 
						)
				rescue => e
    		  p e
      		next
    		end
    	end
		render :json => {movies: Movie.all}
	end

	def show
		p params
		# @movie = Movie.find
	end

	def edit; end

	def update; end

	def destroy; end


end
