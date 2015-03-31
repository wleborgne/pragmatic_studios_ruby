require_relative '../../lib/berserk_player'

describe BerserkPlayer do
  before(:all) do
    # Redirect console output for all examples in this group
    $stdout = StringIO.new
  end

  let(:initial_health) { 50 }
  let(:player) { BerserkPlayer.new('berserker', initial_health) }

  it 'does not go berserk when w00ted up to 5 times' do
    1.upto(5) { player.w00t }

    expect(player.berserk?).to be_falsey
  end

  it 'goes berserk when w00ted more than 5 times' do
    1.upto(6) { player.w00t }

    expect(player.berserk?).to be_truthy
  end

  it 'gets w00ted instead of blammed when it\'s gone berserk' do
    1.upto(6) { player.w00t }
    1.upto(2) { player.blam }

    expect(player.health).to eq(initial_health + (8 * 15))
  end
end
