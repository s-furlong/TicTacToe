# frozen_string_literal: true

class Board
  attr_accessor :value_board

  # rubocop:disable Metrics/AbcSize
  def initialize
    # rubocop:enable Metrics/AbcSize
    @value_board = %w[1 2 3 4 5 6 7 8 9]
  end

  def display_board
    puts " #{value_board[0]} | #{value_board[1]} | #{value_board[2]}\n___|___|___\n #{value_board[3]} | #{value_board[4]} | #{value_board[5]}\n___|___|___\n #{value_board[6]} | #{value_board[7]} | #{value_board[8]}"
  end

end

x = Board.new
y = x.display_board
print y 