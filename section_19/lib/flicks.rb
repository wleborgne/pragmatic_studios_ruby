#!/usr/bin/env ruby
require_relative './movie.rb'
require_relative './playlist.rb'

# movie1 = Movie.new('goonies', 10)
# movie2 = Movie.new('ghostbusters', 9)
# movie3 = Movie.new('goldfinger')

playlist1 = Playlist.new('Kermit')
playlist1.load(ARGV.shift || 'movies.csv')
# playlist1.play(3)
# playlist1.print_stats
loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    puts "Enjoy your #{answer} viewings..."
    playlist1.play(answer.to_i)
  when 'quit', 'exit'
    playlist1.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist1.save
