#!/usr/bin/env ruby
require File.expand_path(File.dirname(__FILE__) + '/playable.rb')
require_relative './treasure_trove'

# Implement Player class
class Player
  include Playable
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def self.from_csv(csv)
    name, health = csv.split(',')
    Player.new(name, Integer(health))
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points},\
 and score = #{score}."
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      treasure = Treasure.new(name, points)
      yield treasure
    end
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def score
    @health + points
  end
end

if __FILE__ == $PROGRAM_NAME
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
