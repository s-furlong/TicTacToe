# frozen_string_literal: true

class Board
  attr_accessor :value_board, :new_board

  # rubocop:disable Metrics/AbcSize
  def initialize
    # rubocop:enable Metrics/AbcSize
    @value_board = %w[1 2 3 4 5 6 7 8 9]
    # rubocop:disable Layout/LineLength
    @new_board = " #{value_board[0]} | #{value_board[1]} | #{value_board[2]}\n___|___|___\n #{value_board[3]} | #{value_board[4]} | #{value_board[5]}\n___|___|___\n #{value_board[6]} | #{value_board[7]} | #{value_board[8]}"
    # rubocop:enable Layout/LineLength
  end

end
