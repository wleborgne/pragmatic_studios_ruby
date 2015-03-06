#!/usr/bin/env ruby
require_relative './player.rb'
require_relative './game_turn.rb'

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
      GameTurn.take_turn(player)
      puts player
    end
  end
  # rubocop:enable Metrics/MethodLength
end
