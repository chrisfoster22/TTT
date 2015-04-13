require 'minitest/autorun'
require 'minitest/pride'
require_relative 'board'

class TestTicTacToe < MiniTest::Unit::TestCase
  def setup
    board = Board.new
  end

  def test_display_board
    board = Board.new
    assert_equal board.display, nil
  end

end
