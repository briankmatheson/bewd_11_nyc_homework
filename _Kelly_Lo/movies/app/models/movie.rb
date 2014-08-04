class Movie < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :description, :length => {minimum: 10}
	validates :year_released, :numericality => {greater_than: 0}

	def self.search_for(query)
		Movie.where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
	end

end
