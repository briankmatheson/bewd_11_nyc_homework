class Movie < ActiveRecord::Base
  def self.search(query)
    Movie.where('title LIKE :query', query:"%#{query}%")
  end

end
