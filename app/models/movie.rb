class Movie < ActiveRecord::Base
	validates :title, :score, :genre, :thumbnail, :url, :release_date, presence: true
  validates :url, uniqueness: true
end

# Psuedocode for movie trailer api call 
# get movie title and substitute the spaces for hyphens
# Ex. "Inside Out"
# Movie.find(1).title.gsub(" ", "-")
# => "Inside-Out"
# Now add that to the api url
# "http://api.traileraddict.com/?film=" + movie_title_with_hyphens
# Use Nokogiri to parse the xml 