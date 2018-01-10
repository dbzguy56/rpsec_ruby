$smiley = "\u263b"
$circle = "\u25d9"
class ConnectFour
  attr_accessor :grid
  def initialize
    @grid = ""
    6.times do
      7.times do
        @grid += $circle + " "
      end
      @grid += "\n"
    end
    print_game_grid
    @grid
  end
  def print_game_grid
    puts "\n     Col"
    7.times {|x| print "#{x+1} "}
    puts
    puts @grid
  end

end
