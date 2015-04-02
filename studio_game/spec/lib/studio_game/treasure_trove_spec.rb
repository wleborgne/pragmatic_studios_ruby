require 'rspec'
require 'studio_game/treasure_trove'

module StudioGame
  describe Treasure do
    let(:treasure) { Treasure.new(:hammer, 50) }

    it 'should be a Treasure' do
      expect(treasure).to be_a(Treasure)
    end

    it 'has a name attribute' do
      expect(treasure.name).to eq(:hammer)
    end

    it 'has a points attribute' do
      expect(treasure.points).to eq(50)
    end
  end

  describe TreasureTrove do
    let(:trove) { TreasureTrove::TREASURES }

    it 'has six treasures' do
      expect(trove.size).to eq(6)
    end

    it 'has a pie worth 5 points' do
      expect(trove[0]).to eq(Treasure.new(:pie, 5))
    end

    it 'has a bottle worth 25 points' do
      expect(trove[1]).to eq(Treasure.new(:bottle, 25))
    end

    it 'has a hammer worth 50 points' do
      expect(trove[2]).to eq(Treasure.new(:hammer, 50))
    end

    it 'has a skillet worth 100 points' do
      expect(trove[3]).to eq(Treasure.new(:skillet, 100))
    end

    it 'has a broomstick worth 200 points' do
      expect(trove[4]).to eq(Treasure.new(:broomstick, 200))
    end

    it 'has a crowbar worth 400 points' do
      expect(trove[5]).to eq(Treasure.new(:crowbar, 400))
    end

    context '#random' do
      it 'returns a random treasure' do
        treasure = TreasureTrove.random
        expect(trove).to include(treasure)
      end
    end
  end
end
