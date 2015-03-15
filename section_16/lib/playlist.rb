require_relative './movie.rb'
require_relative './waldorf_and_statler'
require_relative './snack_bar'

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

    print_snack_menu

    1.upto(viewings) do |count|
      puts "\nViewings: #{count}"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        puts "Had #{SnackBar.random.name} during #{movie.title}."
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

  def print_snack_menu
    snacks = SnackBar::SNACKS
    puts "\nThere are #{snacks.size} snacks available: "

    snacks.each do |snack|
      puts "#{snack.name.capitalize} has #{snack.carbs}."
    end
  end
end
