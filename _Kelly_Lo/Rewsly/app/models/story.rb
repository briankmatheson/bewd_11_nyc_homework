class Story < ActiveRecord::Base
	#validates :upvotes, :numericality => {greater_than: 3}, :on => :index 
	validates :title, :category, :link, :upvotes, presence:true
	validates :title, uniqueness: true
	#validates_date :created_at, :on_or_after => :today, :on => :index
	def self.search_for(query)
		Story.where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
	end
end
