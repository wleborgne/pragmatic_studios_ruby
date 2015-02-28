#!/usr/bin/env ruby

class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @title = name.capitalize
    @health = health
  end

  def name=(new_name)
    @title = new_name.capitalize
  end

  def to_s
    "I'm #{@title} with a health of #{@health} and a score of #{score}."
  end

  def score
    @health + @title.length
  end

  def blam
    @health -= 10
    puts "#{@title} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@title} got w00ted!"
  end
end

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in #{@title}"
    @players.each { |player| puts player }
    @players.each do |player|
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end
end

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

player4 = Player.new('Alvin', 100)
player5 = Player.new('Simon', 60)
player6 = Player.new('Theo', 125)

chipmunks = Game.new('Chipmunks')
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play
