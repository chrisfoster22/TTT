require_relative 'board'
require_relative 'player'
require_relative 'ai'

class Game

  def initialize
    @board = Board.new
    @player = Player.new
    @ai = Ai.new
    @turn = 1
    @winner = ""
  end

  def start
    players = [@ai, @player]
    first_player = players.sample
    second_player = (players - [first_player])[0]
    until over? || @board.possibilities.count == 0
      take_turn(first_player)
      unless @board.possibilities.count == 0 || over?
        take_turn(second_player)
      end
    end
    game_over(@winner)
  end

  def take_turn(active_player)
    active_player.play(@board, @turn, @player)
    @turn += 1
  end

  def over?
    winning_numbers = @board.winning_numbers
    winning_numbers.each do |a|
      if (@player.moves & a).sort == a.sort
        @winner = @player
        return true
      elsif (@ai.moves & a).sort == a.sort
        @winner = @ai
        return true
        break
      elsif @board.possibilities.count == 0
        @winner = nil
        return true
      end
    end
    false
  end

  def game_over(winner)
    if winner == @player
      puts "You won! Impossible!"
    elsif winner == @ai
      puts "YOU LOSE. I told you."
    else
      puts "You didn't win, which basically means you lost."
    end
    puts "Play again? (y/n)"
    answer = gets.chomp
    if answer == "Y" || answer == "y" || answer == "yes" || answer == "Yes"
      game = Game.new
      game.start
    end
  end

end


game = Game.new
puts "Welcome to Tic Tac Toe! Unfortunately you will never win."
puts "xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxox"
game.start
