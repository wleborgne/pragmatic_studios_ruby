#!/usr/bin/env ruby
require_relative './movie.rb'

movie = Movie.new('godfather', 10)

if movie.rank >= 10
  puts 'Hit'
else
  puts 'Flop'
end
