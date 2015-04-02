module Flicks
  module Rankable
    def <=>(other)
      other.rank <=> rank
    end

    def thumbs_down
      self.rank -= 1
    end

    def thumbs_up
      self.rank += 1
    end

    def normalized_rank
      self.rank / 10
    end

    def hit?
      self.rank >= 10
    end

    def status
      hit? ? 'Hit' : 'Flop'
    end
  end
end
