class Player

  attr_reader :last_play, :moves

  def initialize
    @last_play = ""
    @moves = []
  end

  def play(board)
    valid_move = false
    while valid_move == false
      puts "Please choose a row (T = Top, M = Middle, B = Bottom)"
      row = gets.chomp
      puts "Please choose a position (1, 2, or 3)"
      position = gets.chomp.to_i
      play = "#{row + position.to_s}"
      if board.possibilities.include?(play)
        valid_move = true
      else
        puts "That is not a valid move. Please try again, scrub."
      end
    end
    board.possibilities.delete(play)
    @last_play = play
    @moves << play
    board.add_play("X", row, position)
  end


end
