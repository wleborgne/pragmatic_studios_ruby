#!/usr/bin/env ruby

class Movie
  attr_reader :rank
  attr_accessor :title

  def initialize(title, rank = 0)
    @title = title.capitalize
    @rank = rank
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end

  def normalized_rank
    @rank / 10
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end
end

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

movie1 = Movie.new('goonies', 10)
movie2 = Movie.new('ghostbusters', 9)
movie3 = Movie.new('goldfinger')

playlist1 = Playlist.new('Kermit')
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play

playlist2 = Playlist.new('Fozzie')
playlist2.add_movie(movie3)
movie4 = Movie.new('gremlins', 15)
playlist2.add_movie(movie4)
playlist2.play
