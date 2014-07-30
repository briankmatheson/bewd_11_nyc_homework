## Files
## MAIN  - runs the user interface code, retrieves and parses the JSON from API
## SHOPPING CART - contains the items that have been added to the CART
## ITEM - contains the details of the product to be purchased

## JSON: http://api.remix.bestbuy.com/v1/products(customerTopRated=true&active=true)?format=json&apiKey=4vuzcs4srjnrc97px4a8yege&show=all&pageSize=10&page=1

# This program replicates an online shopping store experience where items from Best Buy (well a small subset) are available for purchase

# Initialize
require 'json'
require 'rest-client'
require_relative 'shopping_cart'
require_relative 'item'
json_url = ""

# Clear the console
system "clear"

# Create a shopping cart
def create_shopping_cart
  puts "A new shopping cart has been created for you! \n \n"
  Shopping_Cart.new
end

# Ask user for the type of product they want, and return the json string
def get_item_type
	puts "-----------------------------------------------------------------------------------------"
	puts "Select a number from the menu for the type of item you want:"
	puts "(1) Music \n(2) Movie \n(3) Bundle \n(4) Game \n(5) Software \n(6) Other"

	#Loop until a valid user input has been entered
	valid_input = false
	while !valid_input
		user_input = gets.strip

		#Look for the correct input and return the correct value
		case user_input
			when '1'
				return "Music"
			when '2'
				return "Movie"
			when '3'
				return "Bundle"
			when '4'
				return "Game"
			when '5'
				return "Software"
			when '6'
				return "HardGood"
			else
				puts "You entered an invalid choice, please try again"
			end
		end
end

# Displays all the items and allows user to select an item and add it to the cart
def add_item_to_cart
	puts "------------------------------------ PRODUCT LISTING ------------------------------------"

	# Displays all the items
	@array_of_items.each_with_index do |item, index|
		# Displays the item
		puts "(#{index+1}) Name: #{item.name} || Price: $#{item.price} || Shipping Cost: $#{item.shipping_cost}"
	end
	puts "-----------------------------------------------------------------------------------------"


	# Allow the user to select an item and add it to the cart
	valid_input = false
	puts "\n Select a number from the menu for the product that you want to add to the cart:"
	while !valid_input
		user_input = gets.strip.to_i
		#Check if invalid input
		if user_input == 0
			# Invalid input
			puts "You entered an invalid choice, please try again"
		else
			# Valid input
			valid_input = true
			#Add the item to the cart
			@shopping_cart.add_item(@array_of_items[user_input-1])
			puts "You successfully added #{@array_of_items[user_input-1].name} to your shopping cart!"
		end
	end
end

# Checkout and finalize shopping cart
def checkout_shopping_cart
	puts "------------------------------------ ITEMS PURCHASED ------------------------------------"

	# Displays all the items
	@shopping_cart.items.each_with_index do |item, index|
		# Displays the item
		puts "(#{index+1}) Name: #{item.name} \n"
		puts "Price: $#{item.price}\n"
		puts "Shipping Cost: $#{item.shipping_cost}\n \n"
	end
	puts "-----------------------------------------------------------------------------------------"
	puts "TOTAL Price:                                               $#{@shopping_cart.total_price}"
	puts "TOTAL Shipping Cost:                               $#{@shopping_cart.total_shipping_cost}"
	puts "-----------------------------------------------------------------------------------------"
	puts "GRAND TOTAL:                                                $#{@shopping_cart.total_cost}"
	puts "-----------------------------------------------------------------------------------------\n"
end

# Display welcome message
puts "****************************************************************** \n"
puts "           Welcome to Best Buy Online - Ruby Edition               \n"
puts "****************************************************************** \n \n"


# Start shopping
@shopping_cart = create_shopping_cart
keep_shopping = true
# Keeping shopping until the user wants to stop adding items to the cart
while keep_shopping
	product_type = get_item_type
	page_num = 1
	json_url = "http://api.remix.bestbuy.com/v1/products(customerTopRated=true&active=true&type=#{product_type})?format=json&apiKey=4vuzcs4srjnrc97px4a8yege&show=all&pageSize=10&page=#{page_num}"
	@array_of_items =[]

	# Display items for the user specific product type
	system "clear"
	puts "LOADING..."

	# Pull items from Best Buy JSON
	bestbuy_client = RestClient.get(json_url)
	bestbuy_json = JSON.load(bestbuy_client)
	system "clear"

	# Parse the JSON client for products and make an object
	bestbuy_json["products"].each do |product|
		sku = product["sku"]
		name = product["name"]
		price = product["regularPrice"]
		type = product["type"]
		shipping_cost = product["shippingCost"]
		#Add the Mashable stories to the Hash collection
		@array_of_items << Item.new(sku, name, price, type, shipping_cost)
	end

	# Check if there any items available to purchase
	if @array_of_items.empty?
		puts "There are no items of this product type"
	else
		add_item_to_cart
		sleep(1.5)
		system "clear"
	end

	# Ask if user wants to add any more items
	puts "Do you want to keep adding items to your cart? (Y/N)"
	valid_input = false
	while !valid_input
		user_input = gets.strip.downcase
		#Look for the correct input and return the correct value
		case user_input
			when 'y'
				valid_input = true
			when 'n'
				valid_input = true
				keep_shopping = false
			else
				puts "You entered an invalid choice, please try again"
		end
	end
	system "clear"
end

# Ask if user wants to checkout cart and finalize sale, or abandon shopping cart
puts "Do you want to checkout your shopping cart and finalize sale? (Y/N)"
valid_input = false
while !valid_input
	user_input = gets.strip.downcase
	# Look for the correct input and return the correct value
	case user_input
		when 'y'
			valid_input = true
			# Perform checkout and finalize Sale
			checkout_shopping_cart
		when 'n'
			valid_input = true
			# Exit without checking out shopping cart
		else
			puts "You entered an invalid choice, please try again"
	end
end

# Goodbye Message
puts "Goodbye, thanks for shopping!"
