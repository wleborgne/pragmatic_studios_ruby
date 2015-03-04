#!/usr/bin/env ruby
require_relative './player.rb'
require_relative './Die'

# Implement Game class
class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  # rubocop:disable Metrics/MethodLength
  def play
    puts "There are #{@players.length} players in #{@title}"
    @players.each { |player| puts player }
    @players.each do |player|
      die = Die.new
      number_rolled = die.roll
      case number_rolled
      when (1..2)
        player.blam
      when (3..4)
        puts "#{player.name} was skipped."
      else
        player.w00t
      end
      puts player
    end
  end
  # rubocop:enable Metrics/MethodLength
end
