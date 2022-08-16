#Copyright (c) 2022 Claudio Martínez Ortiz

def stock_picker(fluctuation)

  max_profit = 0
  holder = fluctuation.each_with_index.reduce([]) do |accum, price| 

    fluctuation.each_with_index do |value, idx|
      
      if idx > price[1] && value - price[0] > max_profit

        accum[0] = price[1]
        accum[1] = idx
        max_profit = value - price[0]

      end

    end

    accum

  end

  puts "#{holder} # for a profit of $#{fluctuation[holder[1]]} - $#{fluctuation[holder[0]]} == $#{max_profit}"
  holder

end

stock_picker([17,3,6,9,15,8,6,1,10])