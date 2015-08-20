class Movie < ActiveRecord::Base
	validates :title, :genre, :thumbnail, :url, :release_date, presence: true
  validates :url, uniqueness: true
end
