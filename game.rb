require_relative 'board'
require_relative 'player'
require_relative 'ai'

class Game

  def initialize
    @player = "X"
    @ai = "O"
    @board = Board.new
    @player = Player.new
    @ai = Ai.new
    @turn = 1
    @winning_numbers = [["T1, T2, T3"], ["B1, B2, B3"], ["M1, M2, M3"], ["T1, M1, B1"],
                        ["T2, M2, B2"], ["T3, M3, B3"], ["T1, M2, B3"], ["T3, M2, B1"]]
  end

  def start
    puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
    puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
    until over?
      @ai.play(@board, @turn, @player.last_play)
      unless @board.possibilities.count == 0
        @player.play(@board)
      end
      @turn += 1
    end
  end

  def over?
    false
    @winning_numbers.each do |a|
      if @player.moves & a == a
        puts "YOU WON!!"
        return true
      elsif @ai.moves & a == a
        puts "YOU LOSE."
        return true
      elsif @board.possibilities.count == 0
        puts "You didn't win, which basically means you lost."
        return true
      else
        return false
      end
    end
  end
end

game = Game.new
game.start
