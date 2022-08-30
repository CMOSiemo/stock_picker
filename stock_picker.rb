# frozen_string_literal: true

# Copyright (c) 2022 Claudio Martínez Ortiz

def checker(idx, price1, value, price0, max_profit)
  idx > price1 && value - price0 > max_profit
end

def message(days, fluctuation, max_profit)
  puts "#{days} # for a profit of $#{fluctuation[days[1]]} - $#{fluctuation[days[0]]} == $#{max_profit}"
end

def assign(accum, price, idx, value)
  accum[0] = price[1]
  accum[1] = idx
  value - price[0]
end

def stock_picker(fluctuation)
  max_profit = 0
  days = fluctuation.each_with_index.each_with_object([]) do |price, accum|
    fluctuation.each_with_index do |value, idx|
      next unless checker(idx, price[1], value, price[0], max_profit)

      max_profit = assign(accum, price, idx, value)
    end
  end

  message(days, fluctuation, max_profit)
  days
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
