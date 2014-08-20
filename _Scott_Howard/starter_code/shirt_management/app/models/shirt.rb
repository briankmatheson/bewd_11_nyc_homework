class Shirt < ActiveRecord::Base

	validates :name, :description, presence: true
	validates :description, length: { minimum:10 }
	validates :name, uniqueness: true
  
  def self.search_for(query)
    Shirt.where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
  end

end
