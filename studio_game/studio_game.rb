#!/usr/bin/env ruby

class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def score
    @health + @name.length
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

player1 = Player.new('moe')
puts player1

player2 = Player.new('larry', 60)
puts player2
player2.name = 'lawrence'
puts player2

player3 = Player.new('curly', 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3
