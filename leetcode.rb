# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.

# Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

# For example, given:

#   [1, 7, 3, 4]

# your method would return:

#   [84, 12, 28, 21]

# by calculating:

#   [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]

# Here's the catch: You can't use division in your solution! 
def get_products_of_all_ints_except_at_index(int_array)

    if int_array.length < 2
      raise IndexError, 'Getting the product of numbers at other indices requires at least 2 numbers'
    end
  
    products_of_all_ints_except_at_index = []
  
    # For each integer, we find the product of all the integers
    # before it, storing the total product so far each time.
    product_so_far = 1
    i = 0
    while i < int_array.length
      products_of_all_ints_except_at_index[i] = product_so_far
      product_so_far *= int_array[i]
      i += 1
    end
  
    # For each integer, we find the product of all the integers
    # after it. Since each index in products already has the
    # product of all the integers before it, now we're storing
    # the total product of all other integers.
    product_so_far = 1
    i = int_array.length - 1
    while i >= 0
      products_of_all_ints_except_at_index[i] *= product_so_far
      product_so_far *= int_array[i]
      i -= 1
    end
  
    products_of_all_ints_except_at_index
  end


def get_max_profit(stock_prices)
    if stock_prices.length < 2
      raise ArgumentError, 'Getting a profit requires at least 2 prices'
    end
  
    # We'll greedily update min_price and max_profit, so we initialize
    # them to the first price and the first possible profit.
    min_price = stock_prices[0]
    max_profit = stock_prices[1] - stock_prices[0]
  
    stock_prices.each_with_index do |current_price, index|
  
      # Skip the first time, since we already used it
      # when we initialized min_price and max_profit.
      next if index.zero?
  
      # See what our profit would be if we bought at the
      # min price and sold at the current price.
      potential_profit = current_price - min_price
  
      # Update max_profit if we can do better.
      max_profit = [max_profit, potential_profit].max
  
      # Update min_price so it's always
      # the lowest price we've seen so far.
      min_price  = [min_price, current_price].min
    end
  
    max_profit
  end

  # Input
# flight_length: duration of the flight in minutes
# movies: array of movie times in minutes
# Output
# boolean, true if there exists TWO different movies that add up EXACTLY to the flight_length, and false otherwise
# Examples
# flight_length 160
# movies [80, 110, 40] => false
# [80, 110, 80] => true
# [20, 30, 110, 40, 50] => true
def two_movies(flight_length, movies)
	movie_hash = {}
    
	movies.each do|movie| 
		remaining = flight_length - movie
		return true if movie_hash[remaining] 
		movie_hash[movie] = 'any truthy value'
	end
	false
end

# { 80: 80, 110: 50, 40: 120 }


def find_ways (data)
	previous_number = nil
	total = 0
	data.chars.each do |n|
		e = n.to_i
		if e.between?(1, 26)
			total +=1
		end
		if previous_number && (previous_number + n).to_i.between?(1, 26)
			total += 1
		end
		previous_number = n	
	end
	return total
end

puts find_ways("126")
puts find_ways("12")