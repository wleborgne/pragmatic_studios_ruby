require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player
    def found_treasure(treasure)
      damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
      super(damaged_treasure)
    end
  end
end
