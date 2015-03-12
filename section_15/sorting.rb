#!/usr/bin/env ruby
require_relative '../section_15/lib/movie'

# names = %w(goonies ghostbusters goldfinger godfather)
#
# puts names.sort_by { |word| word.length }

movie1 = Movie.new('goonies', 10)
movie2 = Movie.new('godfather', 3)
movie3 = Movie.new('goldfinger', 7)

movies = [movie1, movie2, movie3]

# puts movies.sort_by(&:rank).reverse
puts movies.sort
