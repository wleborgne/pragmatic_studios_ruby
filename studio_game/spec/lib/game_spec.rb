require 'rspec'
require_relative '../../lib/game.rb'
require_relative '../../lib/die.rb'

describe Game do
  # before(:all) do
  #   $stdout = StringIO.new
  # end
  context '#play' do
    before(:each) do
      $stdout = StringIO.new
      @initial_health = 100
      @player = Player.new('moe', @initial_health)

      @game = Game.new('knuckleheads')
      @game.add_player(@player)
    end

    it 'should w00t the player when a high number is rolled' do
      allow_any_instance_of(Die).to receive(:roll) { 5 }
      @game.play(2)
      expect(@player.health).to eq(@initial_health + 15 * 2)
    end

    it 'should skip the player when a medium number is rolled' do
      allow_any_instance_of(Die).to receive(:roll) { 3 }
      @game.play(2)
      expect(@player.health).to eq(@initial_health)
    end

    it 'should blam the player when a low number is rolled' do
      allow_any_instance_of(Die).to receive(:roll) { 2 }
      @game.play(2)
      expect(@player.health).to eq(@initial_health - 10 * 2)
    end
  end

  context '#print_stats' do
    it 'will display strong players' do
      player = Player.new('player', 150)
      game = Game.new('strong')
      game.add_player(player)
      expected_output = <<-END

1 strong players:
Player (150)

0 wimpy players:
      END
      expect { game.print_stats }.to output(expected_output).to_stdout
    end

    it 'will display wimpy players' do
      player = Player.new('player', 50)
      game = Game.new('wimpy')
      game.add_player(player)
      expected_output = <<-END

0 strong players:

1 wimpy players:
Player (50)
      END
      expect { game.print_stats }.to output(expected_output).to_stdout
    end
  end

  context '#print_treasures' do
    it 'will print the list of treasures with their point values' do
      game = Game.new('EmptyGame')
      expected_output = <<-END

There are 6 treasures to be found:
A pie is worth 5 points
A bottle is worth 25 points
A hammer is worth 50 points
A skillet is worth 100 points
A broomstick is worth 200 points
A crowbar is worth 400 points
      END
      expect { game.print_treasures }.to output(expected_output).to_stdout
    end
  end
end
