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

  def play
    puts "#{@title}'s playlist:"
    puts @movies

    @movies.each do |movie|
      WaldorfAndStatler.review(movie)
    end
  end
end
