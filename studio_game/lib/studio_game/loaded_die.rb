require_relative 'auditable'

module StudioGame
  # Implement a loaded die
  class LoadedDie
    include Auditable
    attr_reader :number

    NUMBERS = [1, 1, 2, 5, 6, 6]

    def roll
      @number = NUMBERS.sample
      audit
      @number
    end
  end
end
