require_relative '../../lib/player.rb'
require_relative '../../lib/treasure_trove'

describe Player do
  before(:all) do
    # Redirect console output for all examples in this group
    $stdout = StringIO.new
  end

  before(:each) do
    @initial_health = 150
    @name = 'larry'
    @player = Player.new(@name, @initial_health)
  end

  it 'has a capitalized name' do
    expect(@player.name).to eq(@name.capitalize)
  end

  it 'has an initial health' do
    expect(@player.health).to eq(@initial_health)
  end

  it 'has a string representation' do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
    exp_string = 'I\'m Larry with health = 150, points = 100, and score = 250.'
    expect(@player.to_s).to eq(exp_string)
  end

  it 'computes a score as the sum of its health and length of name' do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.score).to eq(250)
  end

  it 'increases health by 15 when w00ted' do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam
    expect(@player.health).to eq(@initial_health - 10)
  end

  context 'with a health of 150' do
    before(:each) do
      @initial_health = 150
      @player = Player.new('strongbad', @initial_health)
    end

    it 'is strong' do
      # equivalent to expect(@player.strong?).to be(true)
      expect(@player).to be_strong
    end
  end

  it 'computes points as the sum of all treasure points' do
    expect(@player.points).to eq(0)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(50)
    @player.found_treasure(Treasure.new(:crowbar, 400))
    expect(@player.points).to eq(450)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(500)
  end

  context 'with a health of 100' do
    before(:each) do
      @initial_health = 100
      @player = Player.new('wimpy', @initial_health)
    end

    it 'is not strong' do
      expect(@player).to_not be_strong
    end
  end

  context 'in a collection of players' do
    let(:player1) { Player.new('more', 100) }
    let(:player2) { Player.new('larry', 200) }
    let(:player3) { Player.new('curly', 300) }
    let(:players) { [player1, player2, player3] }

    it 'is sorted by decreasing score' do
      expect(players.sort).to eq([player3, player2, player1])
    end
  end
end
