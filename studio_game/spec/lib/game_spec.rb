require 'rspec'
require_relative '../../lib/game.rb'
require_relative '../../lib/die.rb'

describe Game do
  before(:all) do
    $stdout = StringIO.new
  end

  before(:each) do
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
