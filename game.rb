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
    @players = [@ai, @player]
    @first_player = @players.sample
    @second_player = (@players - [@first_player])[0]
  end


  def start
    puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
    puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
    until over?
      @first_player.play(@board, @turn, @player)
      @turn += 1
      if @board.possibilities.count > 0 && over? == false
        @second_player.play(@board, @turn, @player)
        @turn += 1
      end
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
