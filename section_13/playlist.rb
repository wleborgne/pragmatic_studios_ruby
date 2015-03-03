require_relative './movie.rb'

class Playlist
  attr_reader :title

  def initialize(name)
    @title = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def roll_die
    rand(1..6)
  end

  # rubocop:disable Metrics/MethodLength
  def play
    puts "#{@title}'s playlist:"
    puts @movies

    @movies.each do |movie|
      number_rolled = roll_die
      case number_rolled
      when 1..2
        movie.thumbs_down
        puts "#{movie.title} got a thumbs down!"
      when 3..4
        puts "#{movie.title} was skipped."
      else
        movie.thumbs_up
        puts "#{movie.title} got a thumbs up!"
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
