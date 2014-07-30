class Movie < ActiveRecord::Base
	def self.search(query)
		Movie.where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
	end
end
