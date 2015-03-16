#!/usr/bin/env ruby
require_relative './player.rb'
require_relative './game_turn.rb'
require_relative './treasure_trove'

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

    print_treasures

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong, wimpy = @players.partition(&:strong?)

    print_a_stat(strong, 'strong')
    print_a_stat(wimpy, 'wimpy')
  end

  def print_scores
    puts "\n#{@title.capitalize} High Scores:"
    @players.sort.each do |player|
      puts "#{player.name.ljust(20, '.')} #{player.score}"
    end
  end

  def print_treasures
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.count} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  end

  private

  def print_a_stat(players, kind)
    puts "\n#{players.length} #{kind} players:"
    players.each do |player|
      puts "#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
  end
end
