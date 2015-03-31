#!/usr/bin/env ruby
require_relative './player'
require_relative './clumsy_player'
require_relative './berserk_player'
require_relative './game_turn'
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

  def load_players(file = 'players.csv')
    File.readlines(file).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}"
    @players.each { |player| puts player }

    print_treasures

    1.upto(rounds) do |round|
      break if block_given? && yield

      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        # puts player
      end
    end
  end

  def print_stats
    strong, wimpy = @players.partition(&:strong?)

    print_a_stat(strong, 'strong')
    print_a_stat(wimpy, 'wimpy')
  end

  def print_scores
    score_table.each { |line| puts line }
  end

  def print_treasures
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.count} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  end

  def total_points
    @players.reduce(0) { |a, e| a + e.points }
  end

  def save_high_scores(to_file = 'high_scores.txt')
    File.open(to_file, 'w') do |file|
      score_table.each { |line| file.puts line }
    end
  end

  private

  def score_table
    table = []
    table << "\n#{@title.capitalize} High Scores:"
    @players.sort.each do |player|
      table << "#{player.name.ljust(20, '.')} #{player.score}"
    end
    table
  end

  def print_a_stat(players, kind)
    puts "\n#{players.length} #{kind} players:"
    players.each do |player|
      puts "#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end
end
