# frozen_string_literal: true

class WinRules
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def tie_end?
    @board.new_board.all? { |spot| %w[X O].include?(spot) }
  end

  def win?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def horizontal_win?
    top_row_win = (@board.new_board[0] != '1') && three_all_same_token(@board.new_board[0, 3])
    middle_row_win = (@board.new_board[3] != '4') && three_all_same_token(@board.new_board[3, 3])
    bottom_row_win = (@board.new_board[6] != '7') && three_all_same_token(@board.new_board[6, 3])
    top_row_win || middle_row_win || bottom_row_win
  end

  def vertical_win?
    left_vert_win = (@board.new_board[0] != '1') && three_all_same_token([@board.new_board[0], @board.new_board[3],
                                                                          @board.new_board[6]])
    mid_vert_win = (@board.new_board[1] != '2') && three_all_same_token([@board.new_board[1], @board.new_board[4],
                                                                         @board.new_board[7]])
    right_vert_win = (@board.new_board[2] != '3') && three_all_same_token([@board.new_board[2], @board.new_board[5],
                                                                           @board.new_board[8]])
    left_vert_win || mid_vert_win || right_vert_win
  end

  def diagonal_win?
    top_left_to_bottom_win = (@board.new_board[0] != '1') && three_all_same_token([@board.new_board[0],
                                                                                   @board.new_board[4], @board.new_board[8]])
    top_right_to_bottom_win = (@board.new_board[2] != '3') && three_all_same_token([@board.new_board[2],
                                                                                    @board.new_board[4], @board.new_board[6]])

    top_left_to_bottom_win || top_right_to_bottom_win
  end

  def three_all_same_token(win_array)
    win_array.uniq.count <= 1
  end
end
