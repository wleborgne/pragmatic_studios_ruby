require_relative './movie.rb'
require_relative './waldorf_and_statler'

class Playlist
  attr_reader :title

  def initialize(name)
    @title = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    puts "#{@title}'s playlist:"
    puts @movies.sort

    1.upto(viewings) do |count|
      puts "\nViewings: #{count}"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
      end
    end
  end

  def print_stats
    puts "\n#{title}'s Stats:"

    hits, flops = @movies.partition(&:hit?)

    puts "\nHits:"
    puts hits.sort

    puts "\nFlops:"
    puts flops.sort
  end
end
