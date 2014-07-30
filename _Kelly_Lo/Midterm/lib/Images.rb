class Image
	attr_accessor :image_url :username :tags :likes

	def initialize (image_url, username, tags, likes)
		@image_url = image_url
		@username = username
		@tags = tags
		@likes = likes
	end
end
