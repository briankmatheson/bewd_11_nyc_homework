class Forecast
	attr_accessor :chosen_spot

	def initialize(user_chosen_spot)
		@chosen_spot = user_chosen_spot
	end

	def get_forecast

		if @chosen_spot == "Fort Point"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/113/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		elsif @chosen_spot == "Eagles Point"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/649/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		elsif @chosen_spot == "Deadmans"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/648/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		elsif @chosen_spot == "Kellys Cove"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/697/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		elsif @chosen_spot == "North Ocean Beach"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/114/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		elsif @chosen_spot == "South Ocean Beach"
			@spot_forecast_json =  RestClient.get('http://api.spitcast.com/api/spot/forecast/117/')
			@spot_forecast = JSON.load(@spot_forecast_json)
		end

		puts "\n"
		puts "Your forecast for #{@spot_forecast[0]["spot_name"]} on #{@spot_forecast[0]["date"]}:"
		puts "\n"

		@spot_forecast.each do |hour|
			puts "#{hour["hour"]} Wave size: #{hour["size"]}, Swell: #{hour["shape_detail"]["swell"]}"
		end

	end

end