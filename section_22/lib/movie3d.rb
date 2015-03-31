require_relative './movie'

class Movie3D < Movie
  def initialize(title, rank, wow_factor)
    super(title, rank)
    @wow_factor = wow_factor
  end

  def thumbs_up
    @wow_factor.times { super }
  end

  def show_effect
    puts 'Wow!' * @wow_factor
  end
end

if __FILE__ == $PROGRAM_NAME
  movie3d = Movie3D.new('glee', 5, 10)
  puts movie3d.title
  puts movie3d.rank

  movie3d.thumbs_up
  movie3d.show_effect
  puts movie3d
end
