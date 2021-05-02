#!/usr/bin/ruby

require 'colorize'

colors = ['red','green','yellow','blue','cyan']

given_string = gets

color_index = 0
given_string.each_char do |x|
  print eval("x.#{colors[color_index % colors.length]}")
  color_index += 1
end
