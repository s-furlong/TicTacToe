# frozen_string_literal: true

class Board
  attr_reader :new_board

  def initialize
    @new_board = (1..9).to_a
  end

  def display_board_to_console
    "\n #{@new_board[0]} | #{@new_board[1]} | #{@new_board[2]}\n---+---+---\n #{@new_board[3]} | #{@new_board[4]} | #{@new_board[5]}\n---+---+---\n #{@new_board[6]} | #{@new_board[7]} | #{@new_board[8]}\n\n"
  end
end
