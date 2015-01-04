class BookInStock
	def initialize(isbn, price)
		raise ArgumentError, "Error" if isbn.empty? || price <= 0
		@isbn = isbn
		@price = price
	end

	def isbn
		@isbn
	end
	def isbn=(new_value)
		@isbn = new_value
	end

	def price
		@price
	end
	def price=(new_value)
		@price = new_value
	end

	def price_as_string
		"$#{format("%.2f",@price)}"
	end
end
