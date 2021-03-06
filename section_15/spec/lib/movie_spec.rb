require_relative '../../lib/movie'

describe Movie do
  before(:all) do
    $stdout = StringIO.new
  end

  before(:each) do
    @initial_rank = 10
    @movie = Movie.new('goonies', @initial_rank)
  end
  it 'has a capitalized title' do
    expect(@movie.title).to eq('Goonies')
  end

  it 'has an initial rank' do
    expect(@movie.rank).to eq(@initial_rank)
  end

  it 'has a string representation' do
    expect(@movie.to_s).to eq('Goonies has a rank of 10 (Hit)')
  end

  it 'increases rank by 1 when given a thumbs up' do
    @movie.thumbs_up
    expect(@movie.rank).to eq(@initial_rank + 1)
  end

  it 'decreases rank by 1 when given a thumbs down' do
    @movie.thumbs_down
    expect(@movie.rank).to eq(@initial_rank - 1)
  end

  context 'created with a default rank' do
    before(:each) do
      @movie = Movie.new('goonies')
    end

    it 'has a rank of 0' do
      expect(@movie.rank).to eq(0)
    end
  end

  context 'with a rank of at least 10' do
    before(:each) do
      @movie = Movie.new('goonies', 10)
    end

    it 'is a hit' do
      expect(@movie.hit?).to eq(true)
    end

    it 'has a hit status' do
      expect(@movie.status).to eq('Hit')
    end
  end

  context 'with a rank less than 10' do
    before(:each) do
      @movie = Movie.new('goonies', 9)
    end

    it 'is not a hit' do
      expect(@movie.hit?).to eq(false)
    end

    it 'has a flop status' do
      expect(@movie.status).to eq('Flop')
    end
  end

  context 'is sorted by rank from greater to lesser' do
    let(:lower_ranked) { Movie.new('lower', 5) }
    let(:higher_ranked) { Movie.new('higher', 9) }

    it 'returns 1 if it\'s rank is lesser' do
      expect(lower_ranked <=> higher_ranked).to eq(1)
    end

    it 'returns 0 if it\'s rank is equal' do
      equals_lower = Movie.new('other lower', 5)
      expect(lower_ranked <=> equals_lower).to eq(0)
    end

    it 'returns -1 if it\'s rank is greater' do
      expect(higher_ranked <=> lower_ranked).to eq(-1)
    end
  end
end
