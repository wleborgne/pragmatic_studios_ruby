require_relative '../../lib/player.rb'

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
    # A bit of a hack to keep rubocop happy about line lengths
    expected_string = 'I\'m Larry with a health of 150 and a score of 155.'
    expect(@player.to_s).to eq(expected_string)
  end

  it 'computes a score as the sum of its health and length of name' do
    expected_score = @initial_health + @name.length
    expect(@player.score).to eq(expected_score)
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

  context 'with a health of 100' do
    before(:each) do
      @initial_health = 100
      @player = Player.new('wimpy', @initial_health)
    end

    it 'is not strong' do
      expect(@player).to_not be_strong
    end
  end
end
