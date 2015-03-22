Snack = Struct.new(:name, :carbs)

module SnackBar
  SNACKS = [Snack.new(:popcorn, 20),
            Snack.new(:candy, 15),
            Snack.new(:nachos, 40),
            Snack.new(:pretzel, 10),
            Snack.new(:soda, 5)]

  def self.random
    SNACKS.sample
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'All SNACKS:'
  puts SnackBar::SNACKS

  puts "\nRandom Snack:"
  5.times { puts SnackBar.random }
end
