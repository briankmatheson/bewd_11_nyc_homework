class Movie < ActiveRecord::Base
	
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :description, length: { minimum: 10 }
  validates :year_released, length: { minimum: 1 }

	def self.search_for(query)
    	Movie.where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
  	end

end
	 # attr_accessor :title, :description, :year_released

	# 	def initialize(title, description, year_released)
	# 		@title = title
	# 		@description = description
	# 		@year_released = year_released
		# end

	# Movie.each do |title|
 #  		return "#{title}\n"
 #  	end

