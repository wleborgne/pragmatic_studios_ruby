#!/usr/bin/env ruby
require_relative './game'

# player1 = Player.new('moe')
# player2 = Player.new('larry', 60)
# player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load_players(ARGV.shift || 'players.csv')
klutz = ClumsyPlayer.new('klutz', 105)
knuckleheads.add_player(klutz)
berserker = ClumsyPlayer.new('berserker', 50)
knuckleheads.add_player(berserker)
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)

loop do
  puts 'How many rounds? (\'quit\' to exit)'
  rounds = gets.chomp.downcase
  case rounds
  when /^\d+$/
    knuckleheads.play(rounds.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    knuckleheads.print_scores
    knuckleheads.save_high_scores
    break
  else
    puts 'Enter a number or \'quit\''
  end
end

# player4 = Player.new('Alvin', 100)
# player5 = Player.new('Simon', 60)
# player6 = Player.new('Theo', 125)
#
# chipmunks = Game.new('Chipmunks')
# chipmunks.add_player(player4)
# chipmunks.add_player(player5)
# chipmunks.add_player(player6)
# chipmunks.play(10) do
#   chipmunks.total_points >= 2000
# end
#
# chipmunks.print_stats
# chipmunks.print_scores
