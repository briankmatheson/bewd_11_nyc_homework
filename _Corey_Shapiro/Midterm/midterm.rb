

require 'json'
require 'rest-client'


##RestClient Test

##mash_client = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key={AIzaSyC7UKe3qJev0JgpX6Bg-sKf-LpnL6esDA4}")
##mash_json = JSON.load(mash_client)

##puts "#{mash_json}"


def main
	puts "Enter address to be geocoded:"
	address = gets.chomp
	mash_json = put_address_into_RestClient(address)
	coordinates = coordinate_returning_method(mash_json)
	puts "latitude = #{coordinates[0]}"
	puts "longitude = #{coordinates[1]}"

end

def put_address_into_RestClient(address)
	mash_client = RestClient.get(address)
	mash_json = JSON.load(mash_client)
end	

def coordinate_returning_method(mash_json)
	mash_json.each do |coordinate|
		coordinates << coordinate
	end
end		



