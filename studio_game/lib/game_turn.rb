require_relative './player.rb'
require_relative './die.rb'
require_relative './treasure_trove'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    player_action(number_rolled, player)

    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name}\
 worth #{treasure.points} points."
  end

  def self.player_action(number_rolled, player)
    case number_rolled
    when (1..2)
      player.blam
    when (3..4)
      puts "#{player.name} was skipped."
    else
      player.w00t
    end
  end
end
