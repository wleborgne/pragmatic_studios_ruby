require_relative './movie.rb'

class Playlist
  def initialize(name)
    @title = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play
    puts "#{@title}'s playlist:"
    puts @movies

    @movies.each do |movie|
      movie.thumbs_up
      puts movie
    end
  end
end
