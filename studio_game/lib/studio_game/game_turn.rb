require_relative 'player'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'treasure_trove'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      number_rolled = die.roll
      player_action(number_rolled, player)
      player.found_treasure(TreasureTrove.random)
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
end
