class Item
	attr_accessor :sku, :name, :price, :type, :shipping_cost

	def initialize(sku, name, price, type, shipping_cost)
		@sku = sku
		@name = name
		@price = price
		@type = type
		@shipping_cost = shipping_cost
	end
end