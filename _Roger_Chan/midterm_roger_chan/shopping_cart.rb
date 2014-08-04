class Shopping_Cart
	attr_accessor :items, :ship_to_address, :total_price, :total_shipping_cost, :total_cost

	def initialize
		@items = []
		@ship_to_address = ""
		@total_price = 0
		@total_shipping_cost = 0
		@total_cost = 0
	end

	def add_item(item)
		items << item
		self.total_price += item.price
		self.total_shipping_cost += item.shipping_cost
		self.total_cost += item.price + item.shipping_cost
	end
end