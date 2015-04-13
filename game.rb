require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @player = "X"
    @ai = "O"
    @board = Board.new
  end

  def play
    row = ""
    position = 0
    puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
    puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
    until self.win?
      unless row == "T" || row == "M" || row == "B"
        puts "Please choose a row (T = Top, M = Middle, B = Bottom)"
        row = gets.chomp
      end
      unless position == 1 || position == 2 || position == 3
        puts "Please choose a position (1, 2, or 3)"
        position = gets.chomp.to_i
        p position
      end
    end
  end

  def win?
    if @board =
  end

end

game = Game.new
game.play
