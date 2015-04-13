class Ai

  def play(board, turn, last_play)
    if turn == 1
      puts "I will go first."
      board.add_play("O", "M", 2)
    else
      puts "My Turn!"
      play = board.possibilities.sample
      p play
      board.add_play("O", play[0], play[1].to_i)
      board.possibilities.delete(play)
    end
    board.display

  end

end
