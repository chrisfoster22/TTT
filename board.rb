class Board

  attr_reader :top_row, :middle_row, :bottom_row, :board, :possibilities,
              :last_play, :edges, :corners, :winning_numbers

  def initialize
    @top_row = ["_","_","_"]
    @middle_row = ["_","_","_"]
    @bottom_row = [" "," "," "]
    @board = @top_row + @middle_row + @bottom_row
    @possibilities = ["T1", "T2", "T3", "M1", "M3", "B1", "B2", "B3"]
    @corners = ["T1", "T3", "B1", "B3"]
    @edges = ["T2", "M1", "M3", "B2"]
    @last_play = ""
    @winning_numbers = [["T1", "T2", "T3"], ["B1", "B2", "B3"], ["M1", "M2", "M3"], ["T1", "M1", "B1"],
                        ["T2", "M2", "B2"], ["T3", "M3", "B3"], ["T1", "M2", "B3"], ["T3", "M2", "B1"]]
  end

  def boardify(row)
    row.join("|")
  end

  def display
    puts "#{boardify(@top_row)}\n#{boardify(@middle_row)}\n#{boardify(@bottom_row)}"
  end

  def add_play(player, row, position)
    if row == "T"
      @top_row[position-1] = player
    elsif row == "M"
      @middle_row[position-1] = player
    elsif row == "B"
      @bottom_row[position-1] = player
    end
  end

end
