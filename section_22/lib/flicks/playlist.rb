require_relative './movie.rb'
require_relative './waldorf_and_statler'
require_relative './snack_bar'

module Flicks
  class Playlist
    attr_reader :title

    def initialize(name)
      @title = name
      @movies = []
    end

    def load(from_file)
      File.readlines(from_file).each do |line|
        add_movie(Movie.from_csv(line))
      end
    end

    def save(to_file = './movie_rankings.csv')
      File.open(to_file, 'w') do |file|
        @movies.sort.each do |movie|
          file.puts movie.to_csv
        end
      end
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
          movie.ate_snack(SnackBar.random)
        end
      end
    end

    def print_stats
      puts "\n#{title}'s Stats:"

      puts "\n#{total_carbs} total carbs."

      print_carbs

      print_hits_flops
    end

    def total_carbs
      @movies.reduce(0) { |a, e| a + e.carbs_consumed }
    end

    def print_hits_flops
      hits, flops = @movies.partition(&:hit?)

      puts "\nHits:"
      puts hits.sort

      puts "\nFlops:"
      puts flops.sort
    end

    def print_carbs
      @movies.sort.each do |movie|
        puts "\n#{movie.title} snack totals:"
        movie.each_snack do |snack|
          puts "#{snack.carbs} total #{snack.name} carbs"
        end
        puts "#{movie.carbs_consumed} carbs"
      end
    end

    def print_snack_menu
      snacks = SnackBar::SNACKS
      puts "\nThere are #{snacks.size} snacks available: "

      snacks.each do |snack|
        puts "#{snack.name.capitalize} has #{snack.carbs}."
      end
    end
  end
end
