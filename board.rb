class Board

  attr_reader :top_row, :middle_row, :bottom_row

  def initialize
    @top_row = ["_","_","_"]
    @middle_row = ["_","_","_"]
    @bottom_row = [" "," "," "]
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
