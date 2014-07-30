class Teams
	attr_accessor :name, :id

	def initialize(name, id)
		@name = name
		@id = id
	end

	def name_to_s
		return "#{@name}"
	end

	def id_to_s
		return "#{@id}"
	end


end
