class Movie < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :year_released, numericality: { greater_than: 0 }

	def self.search_for(query)
    Movie.where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
	
end
