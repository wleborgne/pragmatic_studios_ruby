require_relative './auditable'
# Implements a die for game
class Die
  include Auditable
  attr_reader :number

  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
    audit
    @number
  end
end
