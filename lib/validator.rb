# frozen_string_literal: true

class Validator
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def selection_is_valid?(index)
    !space_occupied?(index) && correct_index?(index)
  end

  def space_occupied?(index)
    board.new_board[index] == 'X' || board.new_board[index] == 'O'
  end

  def correct_index?(index)
    (0..8).include? index
  end
end
