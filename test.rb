require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class TestTicTacToe < MiniTest::Unit::TestCase

  def test_game_can_begin
    game = Game.new
    game.start
    assert_equal board.display_board,
  end

end
