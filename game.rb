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
    @winning_numbers = @board.winning_numbers
  end

  def start
    puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
    puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
    until over?
      @ai.play(@board, @turn, @player)
      if @board.possibilities.count > 0 && over? == false
        @player.play(@board)
      end
      @turn += 1
    end
  end

  def over?
    @winning_numbers.each do |a|
      if (@player.moves & a).sort == a.sort
        puts "YOU WON!! IMpossiblele!!"
        return true
      elsif (@ai.moves & a).sort == a.sort
        puts "YOU LOSE."
        return true
        break
      elsif @board.possibilities.count == 0
        puts "You didn't win, which basically means you lost."
        return true
      end
    end
    false
  end
end

game = Game.new
game.start
