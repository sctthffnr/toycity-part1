require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
puts "\n"


# For each product in the data set:
products_hash["items"].each do |toy|
# Print the name of the toy
	puts "#{toy["title"]}"
	30.times { print "*" }
	puts "\n"
# Print the retail price of the toy
	puts "Retail Price: $#{toy["full-price"]}"
# Calculate and print the total number of purchases
	puts "Total number of purchases: #{toy["purchases"].length}"
# Calculate and print the total amount of sales
	total_sales = 0
	toy["purchases"].each do |purchase|
		total_sales = total_sales + purchase["price"]
	end
	puts "Total Sales: $#{total_sales}"
# Calculate and print the average price the toy sold for
	average_price = total_sales / toy["purchases"].length
	puts "Average Sale Price: $#{average_price}"
# Calculate and print the average discount based off the average sales price
	average_discount = 100 * (1 - (average_price / toy["full-price"].to_f))
	puts "Average Discount: #{average_discount.round(2)}%"
	30.times { print "*" }
	puts "\n\n"
end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts


# Figure out how many unique brands are in the data set
brands = []
products_hash["items"].each { |toy| brands.push(toy["brand"]) }
brands.uniq!
# For each brand in the data set:
brands.each do |brand|
	# Print the name of the brand
	puts brand
	30.times { print "*" }
	puts "\n"
	# Create a hash containing a specific brand name
	brand_hash = products_hash["items"].select { |toy| toy["brand"] == brand}
	# Count and print the number of the brand's toys we stock
	stock = brand_hash.inject(0) do |total_stock, brand|
		total_stock + brand['stock']
	end
	puts "Number of Products: #{stock}"
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total revenue of all the brand's toy sales combined
	total_price = 0
	total_revenue = 0
	brand_hash.each do |toy|
		total_price = total_price + toy["full-price"].to_f
		toy["purchases"].each do |purchase|
			total_revenue = total_revenue + purchase["price"]
		end
	end
	average_price = total_price / brand_hash.length
	puts "Average Product Price: $#{average_price.round(2)}"
	puts "Total Sales: $#{total_revenue.round(2)}"
	30.times { print "*" }
	puts "\n\n"
end
