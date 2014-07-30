class Movie < ActiveRecord::Base
  validates :title, :year_released, presence:true
  validates :name, uniqueness:true

  def self.search(query)
    Movie.where('title LIKE :query', query:"%#{query}%")
  end

end
