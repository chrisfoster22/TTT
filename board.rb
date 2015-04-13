class Board

  def initialize
    @top_row = "_|_|_"
    @middle_row = "_|_|_"
    @bottom_row = " | | "
  end

  def display_board
    puts "#{@top_row}\n#{@middle_row}\n#{@bottom_row}"
  end

end
