require 'rspec'
require_relative '../../lib/waldorf_and_statler'

describe WaldorfAndStatler do
  let(:dummy_class) { Class.new { include(WaldorfAndStatler) } }

  # it '#review should return \'Bravo!\'' do
  #   expect(dummy_class.new.review).to eq('Bravo!')
  # end
  # it 'should exist' do
  #   expect(@dummy_class).to exist
  # end
end
