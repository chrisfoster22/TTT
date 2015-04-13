class Ai

  def play(board, turn, last_play)
    if turn == 1
      puts "I will go first."
      board.add_play("O", "M", 2)
    else
      play = board.possibilities.sample
      p play
    end
    board.display

  end

end
