require 'rspec'
require_relative '../../lib/game_turn'
require_relative '../../lib/player'
require_relative '../../lib/die'

describe GameTurn do
  let(:initial_health) { 100 }
  let(:player) { Player.new('moe', initial_health) }

  it 'should w00t a player when a high number is rolled' do
    allow_any_instance_of(Die).to receive(:roll) { 5 }
    GameTurn.take_turn(player)
    expect(player.health).to eq(initial_health + 15)
  end

  it 'should skip a player when a medium number is rolled' do
    allow_any_instance_of(Die).to receive(:roll) { 3 }
    GameTurn.take_turn(player)
    expect(player.health).to eq(initial_health)
  end

  it 'should blam a player when a low number is rolled' do
    allow_any_instance_of(Die).to receive(:roll) { 1 }
    GameTurn.take_turn(player)
    expect(player.health).to eq(initial_health - 10)
  end
end
