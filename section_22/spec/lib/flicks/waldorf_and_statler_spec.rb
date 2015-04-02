require 'rspec'
require 'flicks/waldorf_and_statler'
require 'flicks/movie'

module Flicks
  describe WaldorfAndStatler do
    let(:dummy_class) do
      Class.new do
        include(WaldorfAndStatler)

        def review(movie)
          WaldorfAndStatler.review(movie)
        end
      end
    end

    let(:initial_rank) { 10 }
    let(:movie) { Movie.new('goonies', initial_rank) }

    it 'gives the movie a thumbs up if a high number is rolled' do
      allow(WaldorfAndStatler).to receive(:roll_die) { 5 }
      dummy_class.new.review(movie)
      expect(movie.rank).to eq(initial_rank + 1)
    end

    it 'skips a movie if a medium number is rolled' do
      allow(WaldorfAndStatler).to receive(:roll_die) { 3 }
      dummy_class.new.review(movie)
      expect(movie.rank).to eq(initial_rank)
    end

    it 'gives the movie a thumbs down if a low number is rolled' do
      allow(WaldorfAndStatler).to receive(:roll_die) { 1 }
      dummy_class.new.review(movie)
      expect(movie.rank).to eq(initial_rank - 1)
    end
  end
end
