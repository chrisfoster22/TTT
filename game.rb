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
  end

  def start
    puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
    puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
    until self.over?
      @ai.play(@board, @turn, @player.last_play)
      @player.play(@board)
      @turn += 1
    end
  end

  def ai_play
  end


  def over?
    false
  end

end

game = Game.new
game.start
