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

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}"
    @players.each { |player| puts player }

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end
