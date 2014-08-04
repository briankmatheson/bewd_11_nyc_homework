#Building Class
class Building
	
	attr_accessor :building_name, :building_address, :apartments

	def initialize(name, address)
		@building_name = name
		@building_address = address
		@apartments = []
	end

	def view_apartments
		puts @building_address
		@apartments.each do |unit|
			puts "#{unit.name} .... #{unit.apt_sqft}sf ... bd:#{unit.apt_bedrooms}  ... ba:#{unit.apt_bathrooms}"
		end
	end

	def view_renters
		puts "list of renters #{@building_address}"
		@apartments.each do |unit|
			puts "#{unit.name} ... #{unit.renter.name} ... credit score:#{unit.renter.credit_score}"
		end
	end
end