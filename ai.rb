class Ai

  attr_reader :moves

  def initialize
    @moves = []
    @play = ""
  end

  def play(board, turn, player)
    puts "My Turn!" unless turn == 1
    last_play = player.last_play
    player_moves = player.moves
    possibilities = board.possibilities
    if turn == 1
      puts "I will go first."
      @play = "M2"
    elsif turn == 2
      if board.edges.include?(last_play) || board.corners.include?(last_play)
        @play = "M2"
      else
        @play = board.corners.sample
      end
    elsif turn == 3
      turn_three(board, last_play)
    elsif turn > 3
      @play = possibilities.sample
      board.winning_numbers.each do |a|
        if (a & @moves).count == 2
          possible_play = (a - @moves)[0]
          if possibilities.include?(possible_play)
            @play = possible_play
            break
          end
        elsif (a & player_moves).count == 2
          possible_play = (a - player_moves)[0]
          @play = possible_play if possibilities.include?(possible_play)
        end
      end
      if player_moves.count == 2
        if board.corners.include?(player_moves[0] || player_moves[1]) &&
                  player_moves.include?("M2")
          possible_plays = board.corners & possibilities
          @play = possible_plays.sample
        end
        if player_moves.sort == ["T2", "M3"].sort
          @play = "T3"
        elsif player_moves.sort == ["T2", "M1"].sort
          @play = "T1"
        elsif player_moves.sort == ["B2", "M1"].sort
          @play = "B1"
        elsif player_moves.sort == ["B2", "M3"].sort
          @play = "B3"
        end
      end
    end

    board.add_play("O", @play[0], @play[1].to_i)
    possibilities.delete(@play)
    board.display
    @moves << @play
  end

  def turn_three(board, last_play)
    if board.edges.include?(last_play)
      if last_play == "T2"
        @play = ["B1", "B3"].sample
      elsif last_play == "B2"
        @play = ["T1", "T3"].sample
      elsif last_play == "M1"
        @play = ["T3", "B3"].sample
      elsif last_play == "M3"
        @play = ["T1", "B1"].sample
      end
    elsif board.corners.include?(last_play)
      if last_play == "T1"
        @play = "B3"
      elsif last_play == "T3"
        @play = "B1"
      elsif last_play == "B1"
        @play = "T3"
      elsif last_play == "B3"
        @play = "T1"
      end
    end
  end

end
